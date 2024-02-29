require 'rails_helper'

RSpec.describe RoomNameChecker do
  let(:user1) { create(:user, id:1) }
  let(:user2) { create(:user, id:2) }
  let(:checker) { described_class.new(room, user1) }

  describe '#user_in_room?' do
    context 'when user ID is in room name' do
      let(:room) { create(:room, name: "1_2") }

      it 'returns true' do
        expect(checker.user_in_room?).to eq(true)
      end
    end

    context 'when user ID is not in room name' do
      let(:room) { create(:room, name: '3_4') }

      it 'returns false' do
        expect(checker.user_in_room?).to eq(false)
      end
    end
  end
end
