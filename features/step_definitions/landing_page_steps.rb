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

When("I click {string} button or link") do |element|
  click_link_or_button element
end

Then("I should be redirected to the {string} page") do |page_name|
  expect(page.current_path).to eq page_path_from(page_name)
end

Given("I visit the {string} page") do |page_name|
  visit page_path_from(page_name)
end

When("I click on {string}") do |element|
  click_link_or_button element
end

Then("show me the page") do
  save_and_open_page
end

def page_path_from(page_name)
  case page_name.downcase
    when 'landing' then "/"
    when 'comment' then "/articles/#{@article}/comments/new"
  end
end

def find_article(article_name)
  Article.find_by(title: article_name).id
end
