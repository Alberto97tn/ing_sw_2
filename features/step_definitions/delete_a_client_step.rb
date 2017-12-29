And('I have a list of Clients') do
  @clients = FactoryBot.create_list(:client, 10)
end
And('I have a list of Reports') do
  @reports = FactoryBot.create_list(:report, 40, client_id: @clients.first.id)
end


And('I delete the first client') do
  @client = @clients.first
  expect {first(:link, 'Destroy').click }.to change(Client, :count).by(-1)
end

Then('All the reports associated to that client should be destroyed') do
  Report.where(client_id: @client.id).count.zero?
end


