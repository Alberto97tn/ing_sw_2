Feature: I want to login the user

  Scenario: login with valid credentials
    Given I am on the login page
    When I fill in "Email" with "test@test.com"
    And I fill in "Password" with "test123pass"
    And I press "Log in"
    Then I should be on the home page

   # And I should see "Log in successful"<