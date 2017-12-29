Feature: delete an invoice
  As a user
  I want to delete an invoice

  Background:
    Given I have an account
    And I am Logged In
    And I have a list of Clients
    And I have some client's reports
    And I have created at least one invoice

  Scenario: delete invoice from index page
    Given I am on the Invoices page
    Then I delete the Invoice

