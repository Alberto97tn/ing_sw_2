And('I have a client') do
  @client = FactoryBot.create(:client)
end

Given('I am in client page') do
 visit clients_path(@client)
end

When('I fill to edit the client from with valid data') do
  fill_in 'Name', with: 'Mario'
end

Then('I should see the edited client page') do
  expect(page).to have_content('Mario')
end