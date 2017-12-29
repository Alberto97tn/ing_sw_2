Feature: edit a report
  As a user
  I want to edit a report

  #Per fare questa operazione devo per
  #forza essere loggato, dunque -->
  Background:
    Given I have an account
    And I am Logged In
    And I have a list of Clients
    And I have some client's reports

  Scenario: edit a report successfully
    Given I am on the Report page
    And I click on "Edit"
    When I change the description to "Another Description"
    Then My report should have the description "Another Description"

  Scenario: edit unsuccessful
    Given I am on the Report page
    And I click on "Edit"
    But The form require some inputs
