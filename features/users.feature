Feature: Users
  In order to track thank yous between people
  As a website visitor
  I want to view beers owed and owing for specific users
  
  Scenario: Viewing beers owed by a specific user
    Given Pat owes Paul a beer for pair programming
      And Lena owes Tom a beer for organising Rails Camp
    When I go to the home page
     And I follow "Pat"
    Then I should see "Owes a beer to Paul for pair programming"
     And I should not see "for organising Rails Camp"
  
  Scenario: Viewing beers owed to a specific user
    Given Pat owes Paul a beer for pair programming
      And Lena owes Tom a beer for organising Rails Camp
    When I go to the home page
     And I follow "Paul"
    Then I should see "Owed a beer by Pat for pair programming"
     And I should not see "for organising Rails Camp"
  
  Scenario: View total beers owed
    Given Pat owes Paul a beer for pair programming
      And Pat owes Tom a beer for organising Rails Camp
    When I go to the home page
     And I follow "Pat"
    Then I should see "2"
  
  Scenario: Viewing total beers owing
    Given Paul owes Tom a beer for organising Rails Camp
      And Pat owes Tom a beer for organising Rails Camp
    When I go to the home page
     And I follow "Tom"
    Then I should see "2"

  Scenario: Viewing net beer gain when owing more beers than owed
    Given Pat owes Paul a beer for pair programming
      And Pat owes Tom a beer for organising Rails Camp
    When I go to the home page
     And I follow "Pat"
    Then I should see "-2"
