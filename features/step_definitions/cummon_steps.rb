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

When("I click on {string}") do |string|
  click_on string \
end

And('The form require some inputs') do
  expect(page).to have_xpath("//input[@required='required']")
end
