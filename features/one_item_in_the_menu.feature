Feature:
  There is only one item in the meny

  Scenario: The one item on the menu is the exact match of avail funds
    Given the following input file:
      """
      $15.05
      mixed fruit,$15.05
      """
     When I ask for a suggested menu
     Then the following menus should be presented:
      """
      Menu 1:
      mixed fruit,$15.05
      """
