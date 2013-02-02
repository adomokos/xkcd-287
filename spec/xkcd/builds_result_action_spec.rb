require 'spec_helper'

module Xkcd
  describe BuildsResultAction do

    let(:vegetable_dish) do
      Dish.new.tap do |o|
        o.name = "vegetable"
        o.price = 3.93
      end
    end

    let(:fish_dish) do
      Dish.new.tap do |o|
        o.name = "fish"
        o.price = 5.04
      end
    end


    let(:found_menus) do
      [
        Menu.new.tap do |m|
          m.dishes = [vegetable_dish, fish_dish]
        end
      ]
    end

    let(:context) do
      LightService::Context.make(found_menus: found_menus)
    end

    it "builds the result string" do
      BuildsResultAction.execute(context)

      result = context.fetch :result
      result.should eq "Menu 1:\nvegetable,$3.93\nfish,$5.04"
    end
  end
end
