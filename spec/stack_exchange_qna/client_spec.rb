require 'spec_helper'

module StackExchangeQnA
  describe Client do
    it "should be able to instantiate a stack exchange site" do
      client = Client.new(:api_key => "fake_key", :site => "api.stackoverflow.com")

      client.api_key.should == "fake_key"
      client.site.should == "api.stackoverflow.com"
    end

    it "should be able to configure client via StackExchangeQnA.configure" do
      StackExchangeQnA.configure do |config|
        config.api_key = "Zpl7IOVuaUaMAvnNcftixw"
        config.site = "api.stackoverflow.com"
      end

      client = StackExchangeQnA.client
      client.api_key.should == "Zpl7IOVuaUaMAvnNcftixw"
      client.site.should == "api.stackoverflow.com"
    end
  end
end
