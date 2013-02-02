require 'spec_helper'

module Xkcd
  describe ParsesInputStringAction do

    let(:input_string) { "$15.05\nmixed fruit,$15.05" }

    let(:context) do
      LightService::Context.make(input_string: input_string)
    end

    before { ParsesInputStringAction.execute(context) }


    it "parses out the target price" do
      context.fetch(:target_price).should == 15.05
    end

    it "parses out the available dishes" do
      dishes = context.fetch(:dishes)

      dishes.length.should == 1
      dishes.first.name.should eq "mixed fruit"
      dishes.first.price.should eq 15.05
    end

  end
end
