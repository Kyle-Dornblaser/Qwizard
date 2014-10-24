class WelcomeController < ApplicationController

  # GET /welcome
  def index
    if QuestionInstance.count(:all) == 0
        getCurrentQuestionInstance
    end
    question_instance = QuestionInstance.last

    if Time.now.to_f - question_instance.created_at.to_f > 20
      getCurrentQuestionInstance
    end

    # TODO Refactor question type code
    question = Question.find(question_instance.question_id)
    question_type = question.question_type

    choices = Choice.where(:question_id => question.id)

    @currentQuestionInstance = {
        questionInstance: question_instance,
        question: question,
        choices: choices
    }

    already_answered = false
    if current_user
      if UserResponse.find_by_question_instance_id_and_user_id(question_instance.id, current_user.id)
        render "already_answered"
        already_answered = true
      end
    end

    unless already_answered
      if (question_type == 1)
        render "multiple_choice"
      elsif (question_type == 2)
        render "multiple_select"
      elsif (question_type == 3)
        render "short_answer"
      end
    end

  end

end
