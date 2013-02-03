require 'spec_helper'

module Xkcd
  describe FindsMenusAction do

    let(:stew) do
      Dish.new.tap do |o|
        o.name = "stew"
        o.price = 15.05
      end
    end

    let(:tiramisu) do
      Dish.new.tap do |o|
        o.name = "tiramisu"
        o.price = 3.00
      end
    end

    let(:salad) do
      Dish.new.tap do |o|
        o.name = "salad"
        o.price = 4.25
      end
    end

    context "when the only dish is the exact match" do
      let(:context) do
        LightService::Context.make(dishes: [stew], target_price: 15.05)
      end

      it "creates one found menu with that dish" do
        FindsMenusAction.execute(context)

        found_menus = context.fetch :found_menus
        found_menus.length.should eq 1
        found_menus.first.dishes.should eq [stew]
      end
    end

    context "when 2 dishes are the exact price match" do
      let(:context) do
        LightService::Context.make(dishes: [stew, tiramisu], target_price: 18.05)
      end

      before { FindsMenusAction.execute(context) }

      it "creates one found menu with those dishes" do
        found_menus = context.fetch :found_menus
        found_menus.length.should eq 1
        found_menu = found_menus.first
        found_menu.dishes.should eq [stew, tiramisu]
      end
    end

    context "when there are 3 dishes, last two in found menu" do
      let(:context) do
        LightService::Context.make(dishes: [salad, stew, tiramisu], target_price: 18.05)
      end

      before { FindsMenusAction.execute(context) }

      it "creates one found menu with those dishes" do
        found_menus = context.fetch :found_menus
        found_menus.length.should eq 1
        found_menu = found_menus.first
        found_menu.dishes.should eq [stew, tiramisu]
      end
    end

    context "when there are no matches" do
      let(:context) do
        LightService::Context.make(dishes: [salad], target_price: 18.05)
      end

      before { FindsMenusAction.execute(context) }

      it "sets the 'No Combination of Dishes' error " do
        context.should be_failure
        context.message.should eq "No Combination of Dishes"
      end
    end
  end
end
