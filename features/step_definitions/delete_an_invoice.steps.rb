Given('I am on the Invoices page') do
  visit invoices_path
  expect(page).to have_css('.invoices.index')
end

Then('I delete the Invoice') do
  expect {first(:link, 'Destroy').click}.to change(Invoice, :count).by(-1)
end

