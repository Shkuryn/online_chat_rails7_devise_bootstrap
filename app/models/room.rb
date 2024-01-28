class Room < ApplicationRecord
  # after_create_commit -> {
  #   broadcast_append_to :rooms
  # }
  has_many :messages, dependent: :destroy
end
