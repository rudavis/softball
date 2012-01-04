Feature: Manage Games
	In order have baseball stats
	As a player
	I want to create and manage my games

Scenario: Create Valid Game
	Given I have no games
	And I am on my player page
    When I fill in "Name" with "Team Name"
	And I fill in "Date" with "1-4-2011"
	And I fill in "Hits" with "3"
	And I fill in "At Bats" with "5"
	
    And I press "Add Game"
    Then I should have 1 article
