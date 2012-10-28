Feature: edit movies
  As a user
  I want to be able to add, modify and remove movies
  So I can build a database of my movies.

Background: movies in database

  Given the following movies exist:
  | title        | rating | director     | release_date |
  | Star Wars    | PG     | George Lucas |   1977-05-25 |
  | Blade Runner | PG     | Ridley Scott |   1982-06-25 |
  | Alien        | R      |              |   1979-05-25 |
  | THX-1138     | R      | George Lucas |   1971-03-11 |

Scenario: add new movie
  Given I am on the home page
  And I follow "Add new movie"
  And I fill in "Title" with "Empire Strikes Back"
  And I select "PG" from "Rating"
  And I press "Save Changes"
  Then I should be on the movies page
  And I should see "Empire Strikes Back"

Scenario: edit an existing movie
  Given I am on the home page
  And I follow "More about Alien"
  And I follow "Edit"
  And I fill in "Director" with "Ridley Scott"
  And I press "Update Movie Info"
  And I follow "Back to movie list"
  Then I should be on the movies page
  When I follow "More about Alien"
  Then I should see "Ridley Scott"

