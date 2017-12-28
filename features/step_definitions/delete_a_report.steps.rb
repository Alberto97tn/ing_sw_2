Given("I want to delete a report")do
  @description= Report.first.description
end
And("I confirm the popup")do
  popup= page.driver.browser.switch_to.alert
  popup.accept
end
Then("I should not see that report on the reports page")do
  expect(page).to_not have_content(@description)
end
