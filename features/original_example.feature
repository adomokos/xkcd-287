Feature:
  The original example from TableXI

  Scenario: System finds the combinations
    Given the following input file:
      """
      $15.05
      mixed fruit,$2.15
      french fries,$2.75
      side salad,$3.35
      hot wings,$3.55
      mozzarella sticks,$4.20
      sampler plate,$5.80
      """
     When I ask for a suggested menus
     Then I should get the "No Combination of Dishes" error
