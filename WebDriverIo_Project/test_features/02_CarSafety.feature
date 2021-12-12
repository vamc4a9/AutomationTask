Feature: Verifying the Volvo's new campaign page

Scenario: Verify safety page to contain certain text, controls and also compare it with baseline image for any major changes

    Given I open the "intl/v/car-safety/a-million-more" url
    When I set the "HomePage" as current page
    Then I click on "AcceptAllCookies_Btn" control

    When I click on "learn_more_about_safety_lnk" control
    And I set the "CarSafety" as current page
    Then verify below controls contain given href
      |Learn_More_About_Driver_Assistance_Sys_lnk |/intl/v/car-safety/driver-assistance|
      |Learn_More_About_Child_Safety_lnk          |intl/why-volvo/human-innovation/future-of-driving/safety/child-safety|
      |Learn_More_About_Promotion_lnk             |intl/v/car-safety/a-million-more|
      |Learn_More_About_Sharing_Research_lnk      |intl/v/car-safety/eva-initiative-cars-equally-safe|
      |Learn_More_About_Innovation                |intl/v/car-safety/safety-heritage|
    When I check that current page doesnt deviate much from baseline image visually, allowed difference is 15
    # And I check the the current page for visual differences
    Then close application
