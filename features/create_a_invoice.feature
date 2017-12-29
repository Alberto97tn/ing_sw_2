Feature: create a invoice
  In order to keep track of record
  As a user
  I want to create a new invoice for a Client

  #Per fare questa operazione devo per
  #forza essere loggato, dunque -->
  Background:
    Given I have an account
    And I am Logged In
    Given  I have Clients
    And I have some client's reports

#Creo Scenario per la creazione di una "new invoce"
  @javascript
  Scenario: create a new invoices with pdf
    Given I am in the invoices index page
    And I click on 'New Invoice'
    When I select the client
    Then I can select some unbilled reports
    And I fill the form with valid data
    And I click on "Save"
    Then I should see the invoice page
    And The amount should be equal to the the amount of hours for the hourly_cost plus vat
    When I click on "PDF"
    Then I should see the pdf


#Creao Scenario in caso negativo ovvero non inserico i dati
  Scenario: can't leave Client blank
    Given I am in the invoices index page
    And I click on "New Invoice"
    But The form require some inputs

