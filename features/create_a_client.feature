Feature: Crete a client
  I want to create a client

#Per fare questa operazione devo per
#forza essere loggato, dunque -->
  Background:
    Given I have an acoount
    And I am Logged In

  Scenario: Create a client
    Given I am in a list of clients
    And I click on "New client"
    When I fill to add new client from valid data
    And I click "Save"
    Then I should see the client page

  Scenario: Can't leave Name and Surname blank
    Given I am in a list of clients
    And I click on "New client"
    And I insert the name to "" or the surname to""
    And I click "Save"
    Then I should see one messagge of error
