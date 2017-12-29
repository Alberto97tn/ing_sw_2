Given('I have an account') do
  @user = FactoryBot.create(:user)
end
And('I am Logged In') do
  visit root_path
  fill_in 'Email', with: @user.email
  fill_in 'Password', with: @user.password
  click_on 'Log in'
  expect(page).to have_content('dashboard')
end

When('I click on {string}') do |string|
  click_on string \
end

And('The form require some inputs') do
  expect(page).to have_xpath("//input[@required='required']")
end

And('I confirm the popup') do
  popup = page.driver.browser.switch_to.alert
  popup.accept
end


And('I have created at least one invoice') do
  @invoice = FactoryBot.create(:invoice, client: @clients.first)
end


Given('I am in a list of clients') do
  visit clients_path
  expect(page).to have_css('.clients.index')
end


Given('I am in the reports page') do
  visit reports_path
  expect(page).to have_css('.reports.index')
end