Then('I choose to destroy a report') do
  expect {first(:link, 'Destroy').click}.to change(Report, :count).by(-1)
end
