# frozen_string_literal: true

class Message < ApplicationRecord
  belongs_to :user
  belongs_to :room
  validates_presence_of :content
end
