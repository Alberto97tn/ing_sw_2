Feature: edit an invoice
  As a user
  I want to edit invoices

  #Per fare questa operazione devo per
  #forza essere loggato, dunque -->
  Background:
    Given I have an account
    And I am Logged In
    And I have a list of Clients
    And I have some client's reports
    And I have created at least one invoice

  Scenario: edit an invoice successfully
    Given I am on the Invoice page
    And I click on "Edit"
    When I change the client that the invoice belongs to
    Then My invoice should have the new client's name

  Scenario: edit unsuccessful
    Given I am on the Invoice page
    And I click on "Edit"
    But The form require some inputs
