Feature: testing a search engine

	Scenario Outline:New user successfully search on bing page
	
	Given User launches Bing home page
	When user clicks on search and enters a  <search> string
	Then user is navigated to a page containing <result> keywords
	
	Examples:
	|search   |result     |
	|automate |automate   |        
	|cars     |cars       |