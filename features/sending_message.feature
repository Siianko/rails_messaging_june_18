Feature: Writing and sending a message
	As a user
	In order to get in contact with other users
	I would like to be able to send them messages

	Background:
        Given the following user exist in the database
        | email             | name      | password       | password_confirmation|
        | random@test.com   | randomguy | my-password    | my-password          |
        | pablita@test.com  | Pablita   | my-password    | my-password          |

    Scenario: Compose Email [Happy path]
        And I am logged in as 'randomguy'
        Given I am on my Inbox page
		When I press the 'Compose' link
		And I select 'Pablita' as 'Recipients'
		And I fill out field 'Subject' with 'my subject'
		Then show me the page
		And I fill out field 'Message' with 'my message'
		And I click button 'Send Message'
		Then I should see the text 'Your message was successfully sent!'
		And a message should be sent to 'Recipients'
		And I should see the message on my 'Sent Page'
	
	Scenario: User does not choose Recipients [Sad path]
		When I select Recipient with name ''
		And I fill out field 'Subject' with 'my subject'
		And I fill out field 'Message' with 'my message'
		Then I should see error message 'A recipient is needed'

	Scenario: User does not choose a Subject [Sad Path]
		When I select Recipient with by 'name'
		And I fill out field 'Subject' with ''
		And I fill out field 'Message' with 'my message'
		Then I should see error message 'Fill in a subject'		


		
