Feature:
  Scenarios with three different dishes

  Scenario: Three dishes together will give the target price
    Given the following input file:
      """
      $18.60
      tiramisu,$3.55
      stew,$13.01
      mixed fruit,$2.04
      """
     When I ask for a suggested menus
     Then the following menus should be presented:
      """
      Menu 1:
      tiramisu,$3.55
      stew,$13.01
      mixed fruit,$2.04
      """

  Scenario: Only the last two out of three will give the target price
    Given the following input file:
      """
      $15.05
      tiramisu,$3.55
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

  Scenario: Two pairs will give the target price
    Given the following input file:
      """
      $15.05
      tiramisu,$3.54
      hibachi,$11.51
      stew,$13.01
      mixed fruit,$2.04
      """
     When I ask for a suggested menus
     Then the following menus should be presented:
      """
      Menu 1:
      tiramisu,$3.54
      hibachi,$11.51
      Menu 2:
      stew,$13.01
      mixed fruit,$2.04
      """
