require 'spec_helper'

module StackExchangeQnA
  describe Answer do
    it "gets all answers" do
      answers = Answer.all

      answers.total.should > 0
      answers.first.should be_an_instance_of Answer
    end

    it "gets a particular question" do
      answer = Answer.find(7721751)

      answer.accepted.should be_true
    end
  end
end
