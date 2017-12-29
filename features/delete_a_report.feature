Feature: delete a report
  As a user
  I want to delete a report

  Background:
    Given I have an account
    And I am Logged In
    And I have a list of Clients
    And I have some client's reports

  Scenario: delete report form index page
    Given I am in the reports page
    Then I choose to destroy a report


