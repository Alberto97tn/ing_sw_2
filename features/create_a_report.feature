Feature: create a report
  In order to keep track of record
  As a user
  I want to create a new report for a Client
re
  #Per fare questa operazione devo per
  #forza essere loggato, dunque -->
  Background:
    Given I have an account
    And I am Logged In
    And I have a list of Clients

#Creo Scenario di come creare un report
  Scenario: Create a report
    Given I am on the reports index page
    When I click on "New Report"
    And I fill in the form with valid data
    And I click on "Save"
    Then I should see the report page
    
#Creo Scenario dove il form non lo riempio con dati validi
  Scenario: Can't leave any fields blank
    Given I am on the reports index page
    When I click on "New Report"
    And The form require some inputs

