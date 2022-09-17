Feature: Expleo Challenging DOM
  Description: The purpose of this feature is to test E2E integration for Expleo Challenging DOM

  Scenario: Verify Page Title
    Given user 1 opens a web browser
    When the user navigates to the landing page
    Then the page title content is correct
    
  Scenario: Verify Answer Changes 
    Given user 2 is on the landing page
    When the user clicks on the blue button
    Then the answer value changes
    
  Scenario: Verify Row Content in Table 
    Given user 3 is on the landing page
    When the table is displayed
    Then Row 5 shows Iuvaret4 | Apeirian4 | Adipisci4 | Definiebas4 |	Consequuntur4 |	Phaedrum4
    
  Scenario: Verify edit link can be clicked
  	Given user 4 is on the landing page
    When the user clicks on the edit link
    Then the URL updates to include edit
    
  Scenario: Verify delete link can be clicked
 		Given user 5 is on the landing page
    When the user clicks on the delete link
    Then the URL updates to include delete
    
  Scenario: Verify image can be clicked
  	Given user 6 is on the landing page
    When the user clicks on the image
    Then the URL changes to github
    
 	Scenario: Verify Elemental Selenium link can be clicked
  	Given user 7 is on the landing page
    When the user clicks on the Elemental Selenium link
    Then a new tab opens
    
  Scenario: Find content on landing page
  	Given user 8 is on the landing page
    When the user searches for the word 'Adipisci7'
    Then the content exists on the table
    
  Scenario: User clicks red button
  	Given user 9 is on the landing page
    When the user clicks on the red button
    Then the page refreshes
    
  Scenario: User clicks green button
  	Given user 10 is on the landing page
    When the user clicks on the green button
    Then the page is refreshed
  