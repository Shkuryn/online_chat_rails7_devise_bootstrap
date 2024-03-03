# frozen_string_literal: true

class Room < ApplicationRecord
  has_many :messages, dependent: :destroy
  validates_uniqueness_of :name, case_sensitive: false
end
