Feature: Edit a client
  I want to edit a client

#Per fare questa operazione devo per
#forza essere loggato, dunque -->
  Background:
    Given I have an acoount
    And I am Logged In
    And I have a client

  Scenario: Edit a client
    Given I am in client page
    And I click on "Edit"
    When I fill to edit the client from with valid data
    And I click "Save"
    Then I should see the client page

