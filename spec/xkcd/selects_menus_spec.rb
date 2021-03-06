require 'spec_helper'

module Xkcd
  describe SelectsMenus do

    let(:context) { double('context') }
    let(:input_string) { "hello" }

    it "calls the actions" do
      LightService::Context.stub(:make) \
                           .with({ input_string: input_string }) \
                           .and_return context

      ParsesInputStringAction.should_receive(:execute) \
                       .with(context)

      FindsMenusAction.should_receive(:execute) \
                  .with(context)

      BuildsResultAction.should_receive(:execute) \
                  .with(context)

      result = SelectsMenus.from_input_string(input_string)

      result.should eq context
    end

  end
end
