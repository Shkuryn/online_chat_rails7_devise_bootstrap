Given('there is a user with email {string} and password {string}') do |email, password|
  FactoryBot.create(:user, email: email, password: password, username: email.split("@").first)
end

Given("I am on the login page") do
  visit new_user_session_path
end

When("I log in with email {string} and password {string}") do |email, password|
  fill_in "Email", with: email
  fill_in "Password", with: password
end

When("I press {string}") do |button|
  click_button button
end

Then("I should see {string}") do |content|
  expect(page).to have_content(content)
end

