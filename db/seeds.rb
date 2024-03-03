# frozen_string_literal: true

unless User.exists?
  5.times do |i|
    User.create!(
      email: "user#{i + 1}@example.com",
      username: "user#{i + 1}",
      password: "password#{i + 1}",
      confirmed_at: Time.current
    )
  end
end

unless Room.exists?(name: 'All users')
  All_users = Room.create!(
    name: 'All users',
    private: false
  )
end