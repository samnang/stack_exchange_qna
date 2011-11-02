require 'spec_helper'

module StackExchangeQnA
  describe QueryMethods do
    it "should be able to call chainable" do
      query = Question.where(:tagged => "Ruby")
                      .page(2)
                      .pagesize(42)
                      .includes(:answers)

      query.query_options.should include({:tagged => "Ruby",
                                          :page => 2,
                                          :pagesize => 42,
                                          :answers => true})
    end

    it "should be able to get list objects with including its assocation" do
      questions = Question.where(:tagged => "ruby").includes(:answers)

      questions.first.tags.should include("ruby")
      questions.first.answers.count.should > 0
    end

    describe "#order" do
      it "sort by desc by default" do
        result = Question.order(:votes)
        questions = result.to_a #TODO: users don't have to convert into array

        questions.first.score.should > questions.last.score
      end

      it "sort by asc" do
        result = Question.order(:votes => :asc)
        questions = result.to_a

        questions.first.score.should < questions.last.score
      end
    end
  end
end
