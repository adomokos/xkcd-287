module Xkcd
  class BuildsResultAction
    include LightService::Action

    executed do |context|
      found_menus = context.fetch :found_menus

      result = ""

      found_menus.to_enum.with_index(1).each do |menu, i|
        result << "Menu %s:\n" % i
        menu.dishes.each do |dish|
          result << "%s,$%s\n" % [dish.name, dish.price.to_f]
        end
      end

      context[:result] = result.chomp unless result.blank?
    end
  end
end
