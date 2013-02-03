module Xkcd
  class FindsMenusAction
    include LightService::Action

    executed do |context|

      target_price = context.fetch :target_price
      dishes = context.fetch :dishes

      found_dish_combinations = []

      (1..dishes.size).each do |i|
        combinations = dishes.combination(i).to_a
        combinations.each do |combination|
          total_price_for_combination = combination.map(&:price).reduce(:+)

          # To make sure the logic work, uncomment the line below
          # p "%s - %s" % [total_price_for_combination, target_price]

          if total_price_for_combination == target_price
            found_dish_combinations << combination
          end
        end
      end

      found_menus = found_dish_combinations.map do |dish_combination|
        build_menu(dish_combination)
      end

      if found_menus.any?
        context[:found_menus] = found_menus
      else
        context.set_failure!('No Combination of Dishes')
      end
    end

    private

      def self.build_menu(from_dishes)
         Menu.new.tap { |o| o.dishes = from_dishes }
      end

  end
end
