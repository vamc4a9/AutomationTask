Feature: Verifying the Volvo's new campaign page

Scenario: As a developer, i want the car safety page to contain certain links and data

    Given I open the "intl/v/car-safety/a-million-more" url
    When I set the "HomePage" as current page
    Then I click on "AcceptAllCookies_Btn" control

    When I click on "learn_more_about_safety_lnk" control
    And I set the "CarSafety" as current page
    Then verify below controls are displayed
      |Learn_More_About_Driver_Assistance_Sys_lnk|
      |Learn_More_About_Promotion_lnk|
      |Learn_More_About_Sharing_Research_lnk|
      |Learn_More_About_Innovation|
    When I check that current page doesnt deviate much from baseline image visually, allowed difference is 15
    # And I check the the current page for visual differences
    Then close application
