# frozen_string_literal: true

class RoomRemover
  def initialize(room)
    @room = room
  end

  def delete_room
    return false if room.name == 'All users'

    room.destroy
  end

  private

  attr_reader :room
end
