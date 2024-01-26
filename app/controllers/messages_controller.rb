class MessagesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_room, only: %i[new create]

  def new
    @message = @room.messages.new
  end

  def create
    @message = @room.messages.build(message_params)
    @message.user = current_user
    @room = Room.find(params[:room_id])

    respond_to do |format|
      if @message.save
        format.turbo_stream { render turbo_stream: turbo_stream.append('messages', partial: 'messages/message', locals: { message: @message }) }
      else
        format.html { render :new }
      end
    end
  end

  private

  def set_room
    @room = Room.find(params[:room_id])
  end

  def message_params
    params.require(:message).permit(:content)
  end
end