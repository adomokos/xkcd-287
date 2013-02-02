module Xkcd
  class BuildsResultAction
    include LightService::Action

    executed do |context|
      context[:result] = "Menu 1:\nmixed fruit,$15.05"
    end
  end
end
