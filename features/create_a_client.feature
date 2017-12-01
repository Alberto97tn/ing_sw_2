Feature: Crete a client
  I want to create a client

#Per fare questa operazione devo per
#forza essere loggato, dunque -->
  Background:
    Given I have an account
    And I am Logged In


  Scenario: Create a client
    Given I am in the index page
    When I click on "New Client"
    And I fill to add new client from valid data
    And I click on "Save"
    Then I should see the client page

  Scenario: Can't leave Name  blank
    Given I am in the index page
    When I click on "New Client"
    And I insert the name blank
    And I click on "Save"
    #Then I should see one message of error
    # questo non riusciamo a testarlo perché utilizziamo la validazione tramite l'html 5
    # utilizzando "required: true" nella generazione del form.
    # abbiamo provato diverse implementazioni (vedi gli step definition commentati), sopratutto seguendo
    # questo "articolo": https://medium.com/@tmikeschu/testing-html5-messages-with-rspec-selenium-5f5834c5af10

    # un'idea potrebbe essere controllare semplicemente che la pagina non cambi, ma non è una implementazione che
    # esclude altre casistiche di errore

