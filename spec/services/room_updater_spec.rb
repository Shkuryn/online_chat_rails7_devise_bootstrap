# frozen_string_literal: true

require 'rails_helper'

RSpec.describe RoomUpdater do
  describe '#update_room_name' do
    let(:room) { instance_double('Room', name: room_name, update: true) }
    let(:updater) { RoomUpdater.new(room) }

    context 'when room name is not "All users"' do
      let(:room_name)  { 'Test Room' }

      it 'updates the room name' do
        updater = RoomUpdater.new(room)
        expect(room).to receive(:update).with(name: 'New Name')
        updater.update_room_name('New Name')
      end

      it 'returns true' do
        expect(updater.update_room_name('New Name')).to be true
      end
    end

    context 'when room name is "All users"' do
      let(:room_name) { 'All users' }

      it 'does not update the room name' do
        expect(room).not_to receive(:update)
        updater.update_room_name('New Name')
      end

      it 'returns false' do
        expect(updater.update_room_name('New Name')).to be false
      end
    end
  end
end
