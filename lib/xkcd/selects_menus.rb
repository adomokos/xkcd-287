module Xkcd
  class SelectsMenus

    def self.from_input_string(input_string)
      context = LightService::Context.make(input_string: input_string)

      [
        ParsesInputStringAction,
        FindsMenusAction,
        BuildsResultAction
      ].each { |action| action.execute(context) }

      context
    end

  end
end
