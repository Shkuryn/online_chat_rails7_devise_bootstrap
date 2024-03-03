# frozen_string_literal: true

When('user {string} navigate to the users list') do |username|
  Capybara.using_session(username) do
    visit users_path
  end
end

When('user {string} click to the {string}') do |username, link|
  Capybara.using_session(username) do
    user_link = find('a', text: link)
    user_link.click
  end
end

Then('room for users {string} and {string} created') do |user1, user2|
  id1 = User.find_by(username: user1).id
  id2 = User.find_by(username: user2).id
  room = Room.find_by(name: "#{id1}_#{id2}")
  expect(room).to be_present
end
