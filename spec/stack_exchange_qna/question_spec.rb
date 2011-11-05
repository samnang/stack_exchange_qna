require 'spec_helper'

module StackExchangeQnA
  describe Question do
    it "gets all questions", :vcr => "questions/all" do
      questions = Question.all

      questions.total.should > 0
      questions.first.should be_an_instance_of Question
    end

    it "gets a particular question", :vcr => "questions/3605474" do
      question = Question.find(3605474)

      question.title.should match /Rails's open source projects/
    end

    it "loads answers as its association", :vcr => "questions/3605474_with_answers" do
      question = Question.find(3605474)

      question.should respond_to(:answers)
      question.answers.should_not be_nil
    end
  end
end
