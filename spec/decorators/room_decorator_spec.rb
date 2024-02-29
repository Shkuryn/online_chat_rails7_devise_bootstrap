require 'rails_helper'

RSpec.describe RoomDecorator do
  let(:user1) { create(:user, username: 'user1') }
  let(:user2) { create(:user, username: 'user2') }
  let(:room_decorator) { described_class.new(room) }

  describe '#display_name' do
    context 'when room is private' do
      let(:room) { create(:room, name: "#{user1.id}_#{user2.id}", private: true) }

      it 'returns formatted display name with usernames' do
        expect(room_decorator.display_name).to eq("Private room users user1 and user2")
      end
    end

    context 'when room is not private' do
      let(:room) { create(:room, name: 'Public room') }

      it 'returns the original room name' do
        expect(room_decorator.display_name).to eq('Public room')
      end
    end
  end
end
