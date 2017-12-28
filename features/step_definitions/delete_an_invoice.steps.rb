Then("I should not see that invoice on the invoices page")do
  expect(page).to_not have_content(@invoice.amount)
  expect(page).to_not have_content(@invoice.invoice_number)

end
