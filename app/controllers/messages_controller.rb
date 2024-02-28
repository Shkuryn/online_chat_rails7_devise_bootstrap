class MessagesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_room, only: [:new, :create]

  def new
    @message = @room.messages.new
  end

  def create
    @message = @room.messages.build(message_params)
    @message.user = current_user

    if @message.save
      @message.broadcast_append_to @room, locals: { current_user: current_user }
      redirect_to room_path(@room), notice: "Message was successfully created."
    else
      flash.now[:alert] = "Failed to create message."
      render :new
    end
  end

  private

  def set_room
    @room = Room.find_by(id: params[:room_id])
    redirect_to rooms_path, alert: "Room not found." unless @room
  end

  def message_params
    params.require(:message).permit(:content)
  end
end
