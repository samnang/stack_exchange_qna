require 'spec_helper'

module StackExchangeQnA
  describe QueryMethods do
    it "should be able to call chainable" do
      query = Question.where(:tagged => "Ruby")
                      .page(2)
                      .pagesize(42)
                      .includes(:answers)

      query.query_string.should eql("tagged=Ruby&page=2&pagesize=42&answers=true")
    end
  end
end
