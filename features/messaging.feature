@db
Feature: Messaging

  Background:
    Given there is a user with email "user1@example.com" and password "password1"
    Given there is a room with name "All users"
#    Given there is a user with email "user1@example.com" and password "password1"

  Scenario: Sending a message in the "All users" room
    Given I am on the login page
    When I log in with email "user1@example.com" and password "password1"
    And I press "Log in"
    Given I am on the home page
    When I navigate to the "All users" room
    Then I should see room's title "All users"
    When I fill in "message_content" with "Hello, everyone!" within ".new_messages_container"

    And I press "Send" button
    Then I should see "Hello, everyone!" among the messages in the room