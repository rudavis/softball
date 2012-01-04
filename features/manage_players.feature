Feature: Manage Players
	In order have a baseball card
	As a player
	I want to create and manage my baseball statistics

Scenario: Create Valid Player
	Given I am on the homepage
	And I follow "Get Started"
	Then I should see the new players page
	Given I fill in "Name" with "Russ the bus"
	When I press "Create"
	Then I should be on the players show page