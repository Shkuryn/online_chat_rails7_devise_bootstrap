# frozen_string_literal: true

RSpec.configure do |config|
  config.before(:each, :db) do
    DatabaseCleaner.start
  end

  config.after(:each, :db) do
    DatabaseCleaner.clean
  end
end
