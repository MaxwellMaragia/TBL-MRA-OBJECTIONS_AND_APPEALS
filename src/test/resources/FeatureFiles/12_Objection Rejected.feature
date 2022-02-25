Feature: Reject Objection

  @reject-objection
  Scenario: Lodge Objection
    Given User navigates to the login page
    Then Enters the username "tripsuser" and password "Passw0rd" to login
    When User navigates to Objections and Appeals > Lodge objection
    Then Searches for taxpayer tin "C0105078"
    Then Submit Objection Application
    Then Verify error message "LodgeObjection:ObjectionType: Validation Error: Value is required."
    Then Select objection type as "Objection against a charge or penalty"
    Then Submit Objection Application
    Then Verify error message "Disputed Amount: Validation Error: Value is required."
    Then Verify error message "Summary Of Objection: Validation Error: Value is required."
    Then Enter disputed amount "8000" and summary of objection
    Then Enter attachment schedule "Assesment Copy"
    Then Add disputed transaction details with document reference "MAPE/000004613/2022"
    Then Submit Objection Application
    Then Verify success message "Objection lodged successfully with reference number"
    Then Obtain Objection Case number "Objection lodged successfully with reference number"

  @@reject-objection
  Scenario: UAT_M7-12-02-01-Verify the Process of Verify Application
    Given Open CRM URL Module as "Objectionappealsup1"
    And Close Popup Window
    And Click on Case management dropdown
    And click on Queues
    Then switch to frame0
    And enters service request reference number in search results
    And tick case checkbox
    And pick the case
    Then switch to frame0
    Then Click on reference number
    Then switch to frame1
    And wait for plan to load "Objection Due Date"
    Then switch to frame1
    And Select status as rejected for review
    Then Enter Approval note and select reason
    Then Save objection application
    Then Case status should be "Objection Rejected"