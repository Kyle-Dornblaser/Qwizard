class WelcomeController < ApplicationController

  # GET /welcome
  def index
    question_instance = QuestionInstance.last
    # TODO Refactor question type code
    question = Question.find(question_instance.question_id)
    question_type = question.question_type

    choices = Choice.where(:question_id => question.id)

    @currentQuestionInstance = {
        questionInstance: question_instance,
        question: question,
        choices: choices
    }
    if (question_type == 1)
      render "multiple_choice"
    elsif (question_type == 2)
      render "multiple_select"
    elsif (question_type == 3)
      render "short_answer"
    end

  end

end
