#Given("there is an author called {string}") do |author_name|
# FactoryBot.create(:author, name: author_name)
#end

Given("I am on the list of reports ") do
  @reports = Report.all
end

When("I fill in the form with valid data") do
  fill_in 'Hours', with: 5
  fill_in 'Description', with: "la descrizione è una cosa importante"
  fill_in 'Client_id', 1
  click_on 'Save'
end

 
Then("I should see the the report page") do
  report = Report.last
  expect(page).to have_content(report.description)
end
