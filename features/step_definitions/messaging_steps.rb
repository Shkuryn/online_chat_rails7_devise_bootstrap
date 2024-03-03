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
   find('#message_content').set(value)
end

When("I press {string} button") do |button|
  click_button(button)
end

Then("I should see {string} among the messages in the room") do |message|
  expect(page).to have_css(".card-body.d-flex.flex-row", text: message)
  expect(Message.count).to eq(1)
end
