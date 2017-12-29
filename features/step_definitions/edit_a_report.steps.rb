Given ('I am on the Report page') do
  visit report_path(Report.first.id)
end

When('I change the description to {string}') do |string|
  fill_in 'Description', with: string
  click_on 'Save'
end
Then('My report should have the description {string}') do |string|
  click_on 'Reports'
  expect(page).to have_content(string)
end

When('I leave the description empty') do
  fill_in 'Description', with: ''
  click_on 'Save'
end
