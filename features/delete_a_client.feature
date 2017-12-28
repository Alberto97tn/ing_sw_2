Feature:  I wont to delete a client,
  from his page or from the index page

  Background:
    Given I have an account
    And I am Logged In
    And I have a list of Clients
    And I have a list of Reports



  Scenario: Delete a client form index page
    Given I am in a list of clients
    When I click on "Destroy"
    And I confirm the popup
    Then I should not see "Khal Drogo" on my client list
    And All the hours associated to that client should be destroyed
    And All the invoices billed to that client should be destroyed
