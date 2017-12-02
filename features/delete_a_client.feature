Feature:  I wont to delete a client,
  from his page or from the index page

  Background:
    Given I have an account
    And I am Logged In
    And I have a list of Clients
    And I have a list of Reports



  Scenario: Delete a client form index page
    Given I am in a list of clients
    And I delete the first client
