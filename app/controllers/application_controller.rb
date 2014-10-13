class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  helper_method :current_user, :getCurrentQuestionInstance
  private

  def current_user
    @current_users ||= Admin::User.find(session[:user_id]) if session[:user_id]
  end

   def getCurrentQuestionInstance
    # For the prototype, the current question instance will always create a new question instance
    admin_question_instance = Admin::QuestionInstance.new
    randomQuestionId = Random.rand(Admin::Question.count) + 1
    admin_question_instance.question_id = randomQuestionId
    admin_question_instance.save
    admin_question = Admin::Question.find(admin_question_instance.question_id)
    admin_choices = Admin::Choice.where(:question_id => admin_question.id)

    @currentQuestionInstance = {
    	questionInstance: admin_question_instance,
    	question: admin_question,
    	choices: admin_choices
    }

  end

end
