# Given ('I have a lists of clients') do
#   @clients = FactoryBot.create_list(:client, 10)
#   @clients = Client.all
# end

Given('I am in the clients index page') do
  visit clients_path
  expect(page).to have_css('.clients.index')
end

And('I fill to add new client from valid data') do
  fill_in 'Name', with: 'a....z'
  fill_in 'Surname', with: 'a....z'
  fill_in 'Email', with: 'hello@world.it'
  fill_in 'Phone number', with: 345_785_965
  fill_in 'Company name', with: 'a....z'
  fill_in 'Vat number', with: '243542dsasda'
  fill_in 'Address', with: 'via don ermolao '
end

And('I insert the name blank') do
  fill_in 'Surname', with: 'a....z'
  fill_in 'Email', with: 'hello@world.it'
  fill_in 'Phone number', with: 345_785_965
  fill_in 'Company name', with: 'a....z'
  fill_in 'Vat number', with: '243542dsasda'
  fill_in 'Address', with: 'via don ermolao '
end


# Then("I should see one message of error") do
#   message = page.find("#link_url").native.attribute("validationMessage")
#   expect(message).to eq "Compilare questo campo"
# end
Then('I should see the client page') do
  @client = Client.last
  expect(page).to have_content(@client.name)
end
