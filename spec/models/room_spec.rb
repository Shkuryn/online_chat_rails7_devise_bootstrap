# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Room, type: :model do
  describe 'validations' do
    it { should validate_uniqueness_of(:name).case_insensitive }
  end

  describe 'associations' do
    it { should have_many(:messages).dependent(:destroy) }
  end
end
