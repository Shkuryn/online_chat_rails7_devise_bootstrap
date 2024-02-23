class UsersController < ApplicationController
  before_action :authenticate_user!
  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
    room_name = current_user.id < @user.id ? "#{current_user.id}_#{@user.id}" : "#{@user.id}_#{current_user.id}"
    @room = Room.find_or_create_by!(name: room_name, private: true)
    @messages = @room.messages
    @message = current_user&.messages&.build(room: @room)
    redirect_to room_path(@room)
  end
end
