Feature: Withdraw Objection

  Background:
    Given User navigates to the login page
    Then Enters the username "tripsuser" and password "Passw0rd" to login

  @withdraw-objection
  Scenario: To verify the functionality of withdraw objection
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
    When User navigates to Objections and Appeals > Withdraw objection
    Then Search for valid case
    Then Verify case number
    Then Select reason for withdrawal as "Liability Accepted"
    Then Submit objection withdrawal application
    Then Verify success message "Objection withdrawn successfully for Case - "
    When User navigates to Objections and Appeals > Search case status
    Then Search for valid case
    Then Verify case status as "Objection Withdrawn"
