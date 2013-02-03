require 'bigdecimal'

module Xkcd
  class ParsesInputStringAction
    include LightService::Action

    executed do |context|
      input_string = context.fetch(:input_string)

      lines = input_string.split(/\r?\n/)

      target_price_string = lines.shift

      context[:target_price] = parse_price target_price_string

      context[:dishes] = lines.map do |line|
        parse_dish(line)
      end
    end

    private

      def self.parse_price(source)
        BigDecimal.new source.match(/(\d+\.\d+)/)[1]
      end

      def self.parse_dish(source)
        name, price = source.split(',')
        Dish.new.tap do |dish|
          dish.name = name
          dish.price = parse_price(price)
        end
      end
  end
end
