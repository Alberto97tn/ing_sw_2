And("I have created at least one invoice")do
  @invoice=FactoryBot.create(:invoice, client: @clients.first)
end

When("I change the client that the invoice belongs to") do
  select "#{Client.second.name}", :from => "Client"
  click_on "Save"
end
Then("My invoice should have the new client's name") do
  expect(page).to have_content(Client.second.name)
end

When("I leave the client field empty") do
  select "", :from => "Client"
  click_on "Save"
end
