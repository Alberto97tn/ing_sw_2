Given("I have an acoount") do
  @user=FactoryBot.create(:user)

end
And ("I am Logged In") do
  visit loggin_path
  fill_in "Email", with: @user.email
  fill_in "Password", with: @user.password
  click_on "Submit"
  expect "SCRIVI DOVE VERAI MANDATO DOPO IL LOGIN"
  #dobbiamo ancora creare la parte del LOGIN
end

Given ("I have a lists of clients") do
@clients=Client.all
end
And("I click on New Client")do
fill_in "Name", with: "a....z"
fill_in "Surname", with: "a....z"
fill_in "Email", with: "hello@world.it"
fill_in "Phone Number", with: 345785965
click_on "Save"
end
Then ("I should see the client page") do
@clients=Client.last
expect(page).to have_content(client.description)
end
