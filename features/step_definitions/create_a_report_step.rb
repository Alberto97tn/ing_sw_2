#Given("there is an author called {string}") do |author_name|
# FactoryBot.create(:author, name: author_name)
#end

And('I have a list ofClients') do
  @clients = FactoryBot.create_list(:client, 10)
end

Given('I am on the reports index page') do
  visit reports_path
  page.should have_css('.reports.index')
end

When('I fill in the form with valid data') do
  fill_in 'Hours', with: 5
  fill_in 'Description', with: 'la descrizione è una cosa importante'
  select @clients.first.name, from: 'report_client_id'
end


Then('I should see the report page') do
  @report = Report.last
  expect(page).to have_content(@report.description)
end

