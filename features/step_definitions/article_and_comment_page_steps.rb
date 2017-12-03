Given("I visit the {string} page for {string}") do |page_name, article|
  @article = find_article(article)
  visit page_path_from(page_name)
end

When("I fill in {string} with {string}") do |field, value|
  fill_in field, with: value
end

When("I click {string} on {string}") do |element, article|
  within("#article-#{find_article(article)}") do
    click_link_or_button element
  end
end

Then("I should be redirected to the {string} page for {string}") do |page_name, article|
  @article = find_article(article)
  expect(page.current_path).to eq page_path_from(page_name)
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
