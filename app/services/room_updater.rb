# frozen_string_literal: true

class RoomUpdater
  def initialize(room)
    @room = room
  end

  def update_room_name(name)
    return false if room.name == 'All users'

    room.update(name:)
  end

  private

  attr_reader :room
end
