Feature: Verifying the Volvo's new campaign page

Scenario: As a developer, i want cookie settings page to display when user opens browser

    Given I open the "intl/v/car-safety/a-million-more" url
    When I set the "HomePage" as current page
    Then I check that "AlertBox_PopUp" control is displayed with "We use cookies and local storage for the best experience on our website, including to personalise content and ads, to provide social media features and to analyse traffic."

    When verify below controls are displayed
      |AcceptAllCookies_Btn|
      |CookieSettings_Btn|
    Then I click on "AcceptAllCookies_Btn" control

Scenario: As a developer, i want the home page of new campain page to contain certain text and controls

    Given I set the "HomePage" as current page
    When I check that "mainPage" control is displayed
    Then I check if "mainPage" control contains below text
      |Ideas that change the world are often the most controversial.|
      |After we introduced the 3-point safety belt, we faced a world of criticism. Since then, it has saved more than a million lives. Now it's time for the next step. For everyone's safety.|
      |A million more.|
      |With new and existing safety features, we are determined to save a million more lives.|
      |Speed cap|
      |To send a strong signal about the dangers of speeding, we reduced the top speed of all our new cars to 180 km/h in 2020. We are also looking at how smart speed control and geofencing technology could automatically limit speeds near schools and hospitals in the future.|
      |Highway pilot|
      |With support from LiDAR sensors, the next generation of Volvo cars will be hardware-ready for autonomous drive. And over time, we will push out over-the-air software updates to provide fully autonomous highway driving.|
      |Driver monitoring cameras|
      |To help address intoxication and distraction in traffic, we are working on new in-car solutions. Driver monitoring cameras, together with other sensors, will allow the car to intervene when a clearly intoxicated or distracted driver risks serious injury or death.|
      |Care Key|
      |We've recently introduced the Care Key, aimed at addressing speeding. With the Care Key, Volvo car owners can put a speed cap on the car when lending it to a younger family member or less experienced driver as a way of ensuring a safer ride.|
      |One of a million|
      |Hear the stories from real car crash survivors and see how they've managed to turn an accident into a positive change in their lives.|
      |Amy|
      |Meet Amy Ma, who survived a multi-vehicle collision thanks to the safety belt.|
      |Summer|
      |Hear Summer talk about the collision that destroyed her car, but spared her life thanks to the safety belt.|
      |Linda & Molly|
      |If it wasn't for the safety belt, Linda & Molly's trip to a ski resort could've been their last.|
      |Alex|
      |Alex talks about the collision that nearly took his life, but since he was wearing a safety belt only left him with a scar.|
      |Decades of innovation|

  When I check that current page doesnt deviate much from baseline image visually, allowed difference is 15
  Then verify below controls are displayed
      |learn_more_about_safety_lnk|
      |learn_more_about_innovation|
      |cars_carousel|
      |learn_about_car_from_first_product_lnk|
      |shop_car_from_first_product_lnk|

  When I click on "ourCars_lnk" control
  Then I check that "carsMenu_section" control is displayed
  And I click on "carMenu_Close_icon" control

Scenario: As a developer, i want the menu to be interactable and contain the specified links

    Given I set the "HomePage" as current page
    When I click on "Menu_lnk" control
    And I set the "Menu" as current page
    Then verify below controls are displayed
      |buy_lnk|
      |about_volvo_lnk|
      |explore_lnk|
      |more_lnk|
      |international_lnk|

    When I click on "buy_lnk" control
    Then verify below controls contain given href
      |Car_Configurator_lnk |intl/build                                 |
      |fleet_sales_lnk      |intl/v/buy/fleet-cars                      |
      |used_cars_lnk        |intl/buy/purchase/used-cars                |
      |diplomatic_sales_lnk |intl/v/where-to-buy-diplomat-cars          |
      |child_seats_lnk      |intl/own/owner-info/accessories/child-seats|
    And Capture screenshot
    And I click on "go_back_lnk" control
    Then close application