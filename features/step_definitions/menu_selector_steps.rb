Given /^the following input file:$/ do |input_string|
  @input_string = input_string
end

When /^I ask for a suggested menu$/ do
  @suggested_menus = Xkcd::SelectsMenus.from_input_string(@input_string)
end

Then /^the following menus should be presented:$/ do |menus|
  @suggested_menus.should == menus
end
