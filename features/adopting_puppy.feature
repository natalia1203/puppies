Feature: Adopting puppies
   As a puppy lover
   I want to adopt puppies
   So they can chew my furniture

  @datamagic_checkout
 Scenario: Adopting one puppy
   Given I am on the puppy adoption site
   When I click the View Details button for "Benchy"
   And I click the Adopt Me button
   Then I should see "Benchy" as the name for line item 1
   And I should see "$45.00" as the cart total
   And I click the Complete the Adoption button
   And I complete the adoption
   Then I should see "Thank you for adopting a puppy!"

  @datamagic_checkout
    Scenario: Adopting multiple puppies
      Given I am on the puppy adoption site
      When I click the View Details button for "Benchy"
    And I click the Adopt Me button
    And I click the Adopt Another Puppy button
      When I click the View Details button for "Brook"
    And I click the Adopt Me button
     Then I should see "Benchy" as the name for line item 1
    And I should see "Brook" as the name for line item 2
      And I click the Complete the Adoption button
      And I complete the adoption
    Then I should see "Thank you for adopting a puppy!"

  @datamagic_checkout
  Scenario: Adopting a puppy using all default data
    Given I am on the puppy adoption site
    When I click the View Details button for "Brook"
    And I click the Adopt Me button
    And I click the Complete the Adoption button
    And I complete the adoption
    Then I should see "Thank you for adopting a puppy!"

  @datamagic_checkout
  Scenario: Name is a required field
    Given I am on the puppy adoption site
    When I checkout leaving the name field blank
    Then I should see the error message "Name can't be blank"
