Feature: Creation private room

  Background:
    Given there is a user with email "user1@example.com" and password "password1"
    Given there is a user with email "user2@example.com" and password "password2"
    Given there is a room with name "All users"

  Scenario: Users log in to the application
    Given a user named "user1" is online
    And a user named "user2" is online
    When user "user1" navigate to the users list
    And user "user1" click to the "user2"
    Then room for users "user1" and "user2" created