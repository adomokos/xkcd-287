Given /^the following input file:$/ do |input_string|
  @input_string = input_string
end

When /^I ask for a suggested menus$/ do
  @context = Xkcd::SelectsMenus.from_input_string(@input_string)
end

Then /^the following menus should be presented:$/ do |menus|
  @context[:result].should == menus
end

Then /^I should get the "(.*?)" error$/ do |error_message|
  @context.should be_failure
end
