5.times do |i|
  User.create!(
    email: "user#{i+1}@example.com",
    username: "user#{i+1}",
    password: "password#{i+1}",
    confirmed_at: Time.current
  )
end

All_users = Room.create!(
  name: "All users",
  private: false
)