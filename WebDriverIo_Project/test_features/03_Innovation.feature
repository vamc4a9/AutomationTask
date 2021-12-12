Feature: Verifying the Volvo's new campaign page

Scenario: As a developer, i want the innovation page to contain certain data

    Given I open the "intl/v/car-safety/a-million-more" url
    When I set the "HomePage" as current page
    Then I click on "AcceptAllCookies_Btn" control

    When I click on "learn_more_about_innovation" control
    And I set the "innovations" as current page
    Then verify below controls are displayed
      |title|
    And I check if "mainPage" control contains below text
      |A heritage of safety innovations|
      |In every generation, Volvo has been a pioneer. We are behind some of the most important inventions and innovations in the history of car safety, and we are continuously improving your safety.|
      |1959 – Three-point safety belt|
      |There can be few men on the planet who have saved as many lives as Volvo engineer Nils Bohlin – he introduced three-point safety belts into the series production PV544. Since then, it’s estimated that over one million lives have been saved as a result of Volvo Cars waiving its patent rights so everybody could benefit.|
      |1972 – Rearward-facing child seat|
      |Remember those early images of astronauts lying on their backs during take-off to even out the force on their bodies? Well, that was the basic principle behind our industry-first rearward-facing child seats. To spread the load and minimise injury.|
      |1978 – The booster cushion|
      |We invented the world’s first belt-positioning booster which allowed children from 4 years of age to travel facing forward, with increased protection and comfort.|
      |1990 – World’s first integrated booster cushion|
      |The introduction of the first built-in booster cushion was another huge step forward for child safety. Besides the benefit of increased safety and comfort, the built-in booster cushion also provides a better seating position for the child, allowing them to look out the windows.|
      |1991 – Side Impact Protection System (SIPS)|
      |Another milestone in safety came with our Side Impact Protection System. This was an integral part of the car’s design and included a very strong structure and energy-absorbing materials on the inside, a cross-member in the floor and even reinforced seats. We followed that up in 1994 with another world first: side-impact airbags.|
      |1998 – Whiplash Protection System (WHIPS)|
      |Whiplash injuries are the most frequent injuries in car collisions and may result in long-term pain and disabilities. WHIPS provides uniform support and energy absorption in the rear-end mitigates impacts thanks to a clever seat and head restraint design. The result is a halving of the risk of long-term medical problems.|
      |1998 – Inflatable curtain|
      |The inflatable curtain was yet another leap forward in safety for Volvo Cars. The airbag is concealed in the headliner and inflates rapidly to help protect the occupant’s head during a side impact or rollover scenario. It was the first airbag system to offer improved protection for both front and rear seat occupants.|
    
    And I check that current page doesnt deviate much from baseline image visually, allowed difference is 10