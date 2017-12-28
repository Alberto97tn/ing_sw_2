Feature: delete a report
  As a user
  I want to delete a report

  Background:
    Given I have an account
    And I am Logged In
    And I have a list of Clients
    And I have some client's reports

  Scenario: delete report
    Given I want to delete a report
    And I am on the "Reports" page
    When I choose to "destroy" a "report"
    And I confirm the popup
    Then I should not see that report on the reports page
