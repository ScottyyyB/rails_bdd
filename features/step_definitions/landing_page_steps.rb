Given("I visit the landing page") do
  visit '/'
end

Then("I should see {string}") do |content|
  expect(page).to have_content content
end

Given("the following articles exists") do |table|
  table.hashes.each do |article|
  FactoryBot.create(:article, article)
  end
end

When("I click {string} link") do |new_article|
  click_link new_article
end

When("I fill in {string} with {string}") do |field, value|
  fill_in field, with: value
end

When("I click {string} button") do |create_article|
  click_button create_article
end

Then("I should be on {string} page") do |article_title|
  article = Article.find_by(title: article_title)
  expect(page.current_path).to eq "/articles/#{article.id}"
end
