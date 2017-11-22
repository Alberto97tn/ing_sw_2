Feature: create a report
  In order to keep track of record
  As a user
  I want to create a new report for a Client


  Scenario: create a report
    Given I am on the list of reports
    When I click on "New Report"
    And I fill in the form with valid data
    And I click on "Save"
    Then I should see the report page

