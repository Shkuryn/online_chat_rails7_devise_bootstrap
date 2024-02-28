# frozen_string_literal: true

class RoomNameChecker
  def initialize(room, user)
    @room = room
    @user = user
  end

  def user_in_room?
    user_id_in_name.include?(user.id)
  end

  private

  attr_reader :room, :user

  def user_id_in_name
    room.name.split('_').map(&:to_i)
  end
end
