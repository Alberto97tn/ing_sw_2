Feature: create a invoice
  In order to keep track of record
  As a user
  I want to create a new invoice for a Client

  #Per fare questa operazione devo per
  #forza essere loggato, dunque -->
  Background:
    Given I have an acoount
    And I am Logged In
#Creo Scenario per la creazione di una "new invoce"
  Scenario: create a new invoices
    Given I am on a lists of invoices
    And I click on "New invoice"
    When I fill to add new invoice from valid data
    And I click on "Save"
    Then I should see the invoice page
#Creao Scenario in caso negativo ovvero non inserico i dati
  Scenario: can't leave Client blank
    Given I am on a lists of invoices
    And I click on "New invoice"
    And I doesn't select any client
    And I click "Save"
    Then I should see one messagge of error
