Given("I am on the {string} page") do |string|
  click_on string
end
And("I choose to {string} a {string}") do |op, item|
  click_on "#{op}_#{item}_#{Report.first.id}"
end
When("I change the description to {string}")do |string|
  fill_in "Description", with: string
  click_on "Save"
end
Then("My report should have the description {string}")do |string|
  click_on "Reports"
  expect(page).to have_content(string)
end

When("I leave the description empty") do
  fill_in "Description", with: ""
  click_on "Save"
end
