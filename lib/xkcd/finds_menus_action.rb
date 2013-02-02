module Xkcd
  class FindsMenusAction
    include LightService::Action

    executed do |context|

      dishes = context.fetch :dishes

      context[:found_menus] = dishes.map do |dish|
        Menu.new.tap { |o| o.dishes = [dish] }
      end

    end

  end
end
