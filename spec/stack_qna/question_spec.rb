require 'spec_helper'

module StackExchangeQnA
  describe Question do
    it "gets all questions" do
      questions = Question.all

      questions.total.should > 0
      questions.first.should be_an_instance_of Question
    end

    it "gets a particular question" do
      question = Question.find(3605474)

      question.title.should match /Rails's open source projects/
    end
  end
end
