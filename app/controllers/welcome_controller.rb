class WelcomeController < ApplicationController
  layout "index"

  # GET /welcome
  def index
    if QuestionInstance.count(:all) == 0
        getCurrentQuestionInstance
    end
    question_instance = QuestionInstance.last

    question_age = Time.now.to_f - question_instance.created_at.to_f
    if question_age > 20
      getCurrentQuestionInstance
      # TODO have getCurrentQuestionInstance return an instance that we can use instead of another database call
      question_instance = QuestionInstance.last
      question_age = 0
    end

    # TODO Refactor question type code
    question = Question.find(question_instance.question_id)
    question_type = question.question_type

    choices = Choice.where(:question_id => question.id)

    @currentQuestionInstance = {
        questionInstance: question_instance,
        question: question,
        choices: choices,
        questionAge: question_age.to_i
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
