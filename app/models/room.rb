class Room < ApplicationRecord
  after_create_commit -> {
    Rails.logger.info("FROM MODEL")
    broadcast_append_to :rooms
  }
end
