Feature:  I wont to delete a client,
  from his page or from the index page

  Background:
    Given I have an acoount
    And I am Logged In

    #non so come specificare il nome del cliente che devo cancellare.
    #questo scenario sarà molto probabilemte stravolto nel momento in cui andremo a scrivere l'implementazione
  Scenario: Delete a client form index page
    Given I am in a list of clients
    And I click on "delete"
    Then I should see the same page with one message of success
    And all the report connected to the client are deleted


  Scenario: Delete a client form his page
    Given I am in the shoe of a client named "FBK"
    And I click on "Delete"
    Then I should see index client's page with one message of success


