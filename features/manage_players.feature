Feature: Manage Players
	In order have a baseball card
	As a player
	I want to create and manage my baseball statistics

Scenario: Create Valid Player
	Given a player exists with name: "Rusty", position: "CF"
	When I go to the show page for that player
	Then I should see "Rusty" within "h2"


	And a game exists with player name "Rusty"
	And I follow "Get Started"
	Then I should see the new players page
	Given I fill in "Name" with "Russ the bus"
	When I press "Create"
	Then I should see "Player was successfully created."
	And I should be on the players show page