@db
Feature: User Login
  As a registered user
  I want to log in with my email and password
  So that I can access my account

  Background:
    Given there is a user with email "user1@example.com" and password "password1"
    Given there is a room with name "All users"

  Scenario: Successful login
    Given I am on the login page
    When I log in with email "user1@example.com" and password "password1"
    And I press "Log in"
    Then I should see "Signed in successfully"