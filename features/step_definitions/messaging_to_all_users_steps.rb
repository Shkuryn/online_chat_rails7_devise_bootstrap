# frozen_string_literal: true

Given('a user named {string} is online') do |username|
  Capybara.using_session(username) do
    visit root_path
    fill_in 'user_email', with: "#{username}@example.com"
    fill_in 'Password', with: "password#{username.slice(-1)}"
    click_button 'Log in'
  end
end

When('user {string} fills in {string} with {string}') do |username, field, value|
  Capybara.using_session(username) do
    fill_in field, with: value
  end
end

When('user {string} press {string} button') do |username, button|
  Capybara.using_session(username) do
    click_button(button)
  end
end

When('user {string} navigate to the {string} room') do |username, room_name|
  Capybara.using_session(username) do
    visit rooms_path
    room_link = find('a', text: room_name)
    room_link.click
  end
end

Then('user {string} should see {string}') do |username, message|
  Capybara.using_session(username) do
    expect(page).to have_content(message)
    expect(Message.count).to eq(1)
  end
end
