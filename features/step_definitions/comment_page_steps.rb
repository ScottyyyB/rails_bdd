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
