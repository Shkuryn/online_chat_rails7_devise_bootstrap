# frozen_string_literal: true

require 'rails_helper'

RSpec.describe RoomRemover do
  describe '#delete_room' do
    let(:room) { instance_double('Room', name: room_name, destroy: true) }
    let(:remover) { RoomRemover.new(room) }

    context 'when room name is not "All users"' do
      let(:room_name)  { 'Test Room' }

      it 'destroys the room' do
        expect(room).to receive(:destroy)
        remover.delete_room
      end

      it 'returns true' do
        expect(remover.delete_room).to be true
      end
    end

    context 'when room name is "All users"' do
      let(:room_name) { 'All users' }

      it 'does not destroy the room' do
        expect(room).not_to receive(:destroy)
        remover.delete_room
      end

      it 'returns false' do
        expect(remover.delete_room).to be false
      end
    end
  end
end
