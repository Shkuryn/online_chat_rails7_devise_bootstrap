FactoryBot.define do
  factory :user do
    email { FFaker::Internet.email }
    password { "password123" }
    confirmed_at { Time.current }
  end
end