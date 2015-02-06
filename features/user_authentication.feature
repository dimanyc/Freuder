Feature: User Authentication 

Scenario: Reader successfully authenticates via Twitter

Given I am a new user
When I got to the home page 
And I click on "Sign in with Twitter" button
Then I am able to authenticate myself as a valid user 