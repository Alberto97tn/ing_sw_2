Feature: I want to login the user

   Background:
     Given I have a user

  Scenario: login with valid credentials
    Given I am on the login page
    When I fill the login form
    And I click on "Log in"
    Then I should be on the home page

   # And I should see "Log in successful"<