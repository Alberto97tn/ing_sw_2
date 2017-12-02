And('I have a list of Clients') do
  @clients = FactoryBot.create_list(:client, 10)
end
And('I have a list of Reports') do
  @reports = FactoryBot.create_list(:report, 40)
end

Given("I am in a list of clients") do
  visit clients_path
  expect(page).to have_css('.clients.index')
end

And("I delete the first client")do
  expect{ first(:link, 'Destroy').click }.to change(Client, :count).by(-1)
end