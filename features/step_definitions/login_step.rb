=begin
And ("I am Logged In") do
  visit loggin_path
  fill_in "Email", with: @user.email
  fill_in "Password", with: @user.password
  click_on "Submit"
  expect "SCRIVI DOVE VERAI MANDATO DOPO IL LOGIN"
  #dobbiamo ancora creare la parte del LOGIN
end

Given /^I am not signed in$/ do
  current_driver = Capybara.current_driver
  begin
    Capybara.current_driver = :rack_test
    page.driver.submit :delete, "/users/sign_out", {}
  ensure
    Capybara.current_driver = current_driver
  end
end
=end


Given("I am on the login page") do
  visit
end
