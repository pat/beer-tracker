Feature: Tallying Beers
  In order to track how many thank yous people have made
  As a website visitor
  I should be able to see who has beers owed and owing
  
  Scenario: Viewing list of latest beers
    Given Pat owes Paul a beer for pair programming
    When I go to the home page
    Then I should see "Pat owes Paul"
     And I should see "a beer for pair programming"
