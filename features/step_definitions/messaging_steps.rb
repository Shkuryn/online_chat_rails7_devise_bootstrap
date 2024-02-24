Given("I am on the home page") do
  visit root_path
end

Given('there is a room with name {string}') do |name|
  FactoryBot.create(:room, name: name)
end

When("I navigate to the {string} room") do |room_name|
  visit rooms_path
  room_link = find("a", text: room_name)
  room_link.click
end

Then("I should see room's title {string}") do |content|
  expect(page).to have_content(content)
end

When("I fill in {string} with {string} within {string}") do |field, value, selector|

  sleep 2
  # within('new_messages_container') do
  #   find('#message_content').set(value)
  # end

  if page.has_selector?('#message_content')
    find('#message_content').set(value)
    # puts 'Element found: ok'
  else
    # puts 'Element not found: fail'
  end

end

When("I press {string} button") do |button|
  # within(selector) do
  Rails.logger.info("USERS= #{User.count}")
    click_button(button)
  # end
end

Then("I should see {string} among the messages in the room") do |message|
  expect(page).to have_css(".message", text: message)
end
