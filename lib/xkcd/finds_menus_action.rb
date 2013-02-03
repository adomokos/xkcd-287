module Xkcd
  class FindsMenusAction
    include LightService::Action

    executed do |context|

      target_price = context.fetch :target_price
      dishes = context.fetch :dishes

      exact_matches = []
      dishes.delete_if { |v| exact_matches << v if v.price == target_price }

      context[:found_menus] = exact_matches.map do |dish|
        build_menu([dish])
      end


      if dishes.size == 2
        total_price = dishes.map(&:price).reduce(:+)

        if total_price == target_price
          context[:found_menus] << build_menu(dishes)
        end
      end

    end

    private

      def self.build_menu(from_dishes)
         Menu.new.tap { |o| o.dishes = from_dishes }
      end

  end
end
