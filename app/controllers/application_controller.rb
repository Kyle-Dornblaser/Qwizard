class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  helper_method :current_user, :getCurrentQuestionInstance, :percentage_correct
  private

  def current_user
    @current_users ||= User.find(session[:user_id]) if session[:user_id]
  end

  def getCurrentQuestionInstance
    # For the prototype, the current question instance will always create a new question instance
    question_instance = QuestionInstance.new
    randomQuestionId = Random.rand(Question.count) + 1
    question_instance.question_id = randomQuestionId
    question_instance.save
    question = Question.find(question_instance.question_id)
    choices = Choice.where(:question_id => question.id)

    @currentQuestionInstance = {
    	questionInstance: question_instance,
    	question: question,
    	choices: choices
    }
  end
  
  def percentage_correct
    correct = UserResponse.where("user_id =" + current_user.id.to_s).where("award > 0").count
    total = UserResponse.where("user_id =" + current_user.id.to_s).count
    if (total == 0)
        percentage = 100
    else
        percentage = (correct.to_f / total.to_f) * 100
    end
    percentage.to_i
  end
  
  def point_pool
    question_instance = QuestionInstance.last
    question = Question.find(question_instance.question.id)
    difficulty = Difficulty.find(question.difficulty.id)
    difficulty.points
  end
  
  def current_pool
    total = point_pool
    question_instance = QuestionInstance.last
    responseTotal = UserResponse.where("question_instance_id =" + question_instance.id.to_s).count
    
    pointsLeft = total - responseTotal
  end

end