Feature: Messaging to all users

  Background:
    Given there is a user with email "user1@example.com" and password "password1"
    Given there is a user with email "user2@example.com" and password "password2"
    Given there is a user with email "user3@example.com" and password "password3"
    Given there is a room with name "All users"

  Scenario: Users log in to the application
    Given a user named "user1" is online
    And a user named "user2" is online
    And a user named "user3" is online
    When user "user1" fills in "message_content" with "Hello, everyone!"
    And user "user1" press "Send" button
    When user "user2" navigate to the "All users" room
    Then user "user2" should see "Hello, everyone!"
    When user "user3" navigate to the "All users" room
    Then user "user3" should see "Hello, everyone!"