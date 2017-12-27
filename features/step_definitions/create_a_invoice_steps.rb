Given('I have Clients') do
  @clients = FactoryBot.create_list(:client, 10)
end

And("I have some client's reports") do
  @reports = FactoryBot.create_list(:report, 10, client_id: @clients.first.id)
end

Given('I am in the invoices index page') do
  visit invoices_path
  expect(page).to have_css('.invoices.index')
end

When('I select the client') do
  select @clients.first.name, from: 'invoice_client_id'
end

Then('I can select some unbilled reports') do
   expect(page).to have_selector('#selection_multiple', visible: true)
   select @reports.first.description, from: 'invoice_reports_ids'
end

And('I fill the form with valid data') do
  fill_in 'Amount', with: '0'

  select_date('31/12/2014', :from => 'Date')

  #gli altri campi sono già impostati di default
end

Then('I should see the invoice page') do
  @invoice = Invoice.last
  expect(page).to have_css('.invoices.show')
end

And('The amount should be equal to the the amount of hours for the hourly_cost plus vat') do
  @invoice.amount = Report.where(invoice_id: @invoice.id).sum(:hours) *
                    @invoice.hourly_cost + @invoice.vat / 100
end

And('I should see the pdf') do
  expect(current_path).to eq invoice_path(@invoice, format: 'pdf')
end

