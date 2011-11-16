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

    it "should be able to get list objects with including its assocation", :vcr => "questions/ruby_with_answers" do
      questions = Question.where(:tagged => "ruby").includes(:answers)

      questions.first.tags.should include("ruby")
      questions.first.answers.count.should_not be_nil
    end

    describe "#order" do
      it "sort by desc by default", :vcr => "questions/all_ordered_by_votes_desc" do
        result = Question.order(:votes)
        questions = result.to_a #TODO: users don't have to convert into array

        questions.first.score.should > questions.last.score
      end

      it "sort by asc", :vcr => "questions/all_ordered_by_votes_asc" do
        result = Question.order(:votes => :asc)
        questions = result.to_a

        questions.first.score.should < questions.last.score
      end
    end

    describe "#total, #page, #pagesize" do
      it "should be able return reponse stats of the query", :vcr => "questions/ruby_with_answers" do
        questions = Question.where(:tagged => "ruby").includes(:answers)

        questions.total.should == 33840
        questions.page.should == 1
        questions.pagesize.should == 30
      end
    end
  end
end
