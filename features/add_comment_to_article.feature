Feature: Adding Comments
  As a visitor
  In order to give my opinion on an article
  I would like to be able to add a comment to a specific article


  Background:
    Given the following articles exists
    | title                | content                          |
    | A breaking news item | Some really breaking action      |
    | Learn Rails 5        | Build awesome rails applications |


  Scenario: Add comment to a specific article
    When I visit the landing page
    And I fill in "Comment" for "Learn Rails 5" with "I love this"
    And I click "Create Comment" on "Learn Rails 5"
    Then I should see "I love this"
