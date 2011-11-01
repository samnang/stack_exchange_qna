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

    it "should be able to get list objects with including its assocation" do
      pending
      questions = Question.where(:tagged => "Ruby").includes(:answers)


      questions.first.answers.count.should > 0
    end
  end
end
