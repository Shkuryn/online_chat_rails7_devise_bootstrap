class MessagesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_room, only: %i[new create]

  def new
    @message = @room.messages.new
  end

  def create
    @room = Room.find(params[:room_id])
    @message = @room.messages.build(message_params)
    @message.user = current_user
    @user = current_user

    if @message.save
      @message.broadcast_append_to @room, locals: { user: @user }
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