Feature: sort movies
  As a user
  I want to be able to sort movies
  So I can find specific movies more easily.

Background: movies in database

  Given the following movies exist:
  | title        | rating | director     | release_date |
  | Star Wars    | PG     | George Lucas |   1977-05-25 |
  | Blade Runner | PG     | Ridley Scott |   1982-06-25 |
  | Alien        | R      |              |   1979-05-25 |
  | THX-1138     | R      | George Lucas |   1971-03-11 |

Scenario: sort by title
  Given I am on the home page
  And I should see "Star Wars" before "Alien"
  When I follow "Movie Title"
  Then I should see "Alien" before "Star Wars"

Scenario: sort by release date
  Given I am on the home page
  And I should see "Alien" before "THX-1138"
  When I follow "Release Date"
  Then I should see "THX-1138" before "Alien"