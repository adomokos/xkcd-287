Feature:
  The Items on the menu are the exact match for the target price

  Scenario: The one item on the menu is the exact match of avail funds
    Given the following input file:
      """
      $15.05
      mixed fruit,$15.05
      """
     When I ask for a suggested menus
     Then the following menus should be presented:
      """
      Menu 1:
      mixed fruit,$15.05
      """

  Scenario: Both of the items on the menu are exact match of avail funds
    Given the following input file:
      """
      $15.05
      mixed fruit,$15.05
      pasta,$15.05
      """
     When I ask for a suggested menus
     Then the following menus should be presented:
      """
      Menu 1:
      mixed fruit,$15.05
      Menu 2:
      pasta,$15.05
      """
