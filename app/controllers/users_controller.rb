# frozen_string_literal: true

class UsersController < ApplicationController
  before_action :authenticate_user!
  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
    room_name = generate_room_name(current_user.id, @user.id)
    @room = Room.find_or_create_by!(name: room_name, private: true)
    @messages = @room.messages
    @message = current_user&.messages&.build(room: @room)
    redirect_to room_path(@room)
  end

  private

  def generate_room_name(user1_id, user2_id)
    user1_id < user2_id ? "#{user1_id}_#{user2_id}" : "#{user2_id}_#{user1_id}"
  end
end
