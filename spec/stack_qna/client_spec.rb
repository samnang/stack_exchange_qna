require 'spec_helper'

module StackQnA
  describe Client do

    it "should be able to instantiate a stack exchange site" do

      client = Client.new(:api_key => "fake_key", :site => "api.stackoverflow.com")

      client.api_key.should == "fake_key"
      client.site.should == "api.stackoverflow.com"
    end
  end
end
