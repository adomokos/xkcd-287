Feature:
  System provides the text "No Combination of Dishes" if none found

  Scenario: System provides the no combination of dishes error message
    Given the following input file:
      """
      $18.60
      tiramisu,$3.55
      """
     When I ask for a suggested menus
     Then I should get the "No Combination of Dishes" error
