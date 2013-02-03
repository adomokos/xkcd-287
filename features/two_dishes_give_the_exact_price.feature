Feature:
  The two dishes on the menu are the exact match of the target price

  Scenario: Two dishes together will give the exact price
    Given the following input file:
      """
      $15.05
      stew,$13.01
      mixed fruit,$2.04
      """
     When I ask for a suggested menus
     Then the following menus should be presented:
      """
      Menu 1:
      stew,$13.01
      mixed fruit,$2.04
      """
