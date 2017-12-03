Feature: Adding Comments
  As a visitor
  In order to give my opinion on an article
  I would like to be able to add a comment to a specific article


  Background:
    Given the following articles exists
    | title                | content                          |
    | A breaking news item | Some really breaking action      |
    | Learn Rails 5        | Build awesome rails applications |


  Scenario: Go to specific article comment page
    Given I visit the "Landing" page
    When I click "Add Comment" on "Learn Rails 5"
    Then I should be redirected to the "Comment" page for "Learn Rails 5"


  Scenario: Add comment to a specific article [Happy Path]
    Given I visit the "Comment" page for "Learn Rails 5"
    When I fill in "Body" with "I love this"
    And I click "Create Comment" button or link
    Then I should be redirected to the "Landing" page
    And I should see "Comment has been successfully created."
    And I should see "I love this"


  Scenario: Add comment with no body [Sad Path]
    Given I visit the "Comment" page for "Learn Rails 5"
    And I click "Create Comment" button or link
    Then I should see "Body can't be blank"


  Scenario: Add comment with invalid email [Sad Path]
    Given I visit the "Comment" page for "Learn Rails 5"
    And I fill in "Body" with "Big Arnold"
    And I fill in "Email" with "hotmale"
    When I click "Create Comment" button or link
    Then I should see "Email is not valid"
