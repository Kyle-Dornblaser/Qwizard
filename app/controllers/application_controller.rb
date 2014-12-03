class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  helper_method :current_user, :getCurrentQuestionInstance, :percentage_correct, :total_points, :question_leaderboard, :question_percent_correct, :piece_of_shit
  
  
  
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
  
  def question_leaderboard
    question_instance = QuestionInstance.last
    query = "SELECT users.username, MAX(user_responses.award) AS award 
             FROM users JOIN user_responses 
             ON users.id = user_responses.user_id 
             WHERE question_instance_id = " + question_instance.id.to_s + " 
             GROUP BY users.username 
             ORDER BY MAX(user_responses.award) DESC"
    results = ActiveRecord::Base.connection.execute(query);
  end
  
  def question_percent_correct
    #question_instance = QuestionInstance.last
    #num_correct = UserResponse.where("question_instance_id = " + question_instance.question_id.to_s + "").where("correct IS TRUE").count
    #total_num = UserResponse.where("question_instance_id = " + question_instance.question_id.to_s + "").count
    question_instance = QuestionInstance.last
    query = "SELECT COUNT(user_responses.correct IS TRUE)+1 AS num_correct, COUNT(user_responses.correct)+1 AS total_num, (COUNT(user_responses.correct IS TRUE)/(COUNT(user_responses.correct)+1))*100 as q_percentage_correct
            FROM user_responses JOIN question_instances ON user_responses.question_instance_id = question_instances.id 
            WHERE question_instances.question_id = " + question_instance.question_id.to_s + ""
    results = ActiveRecord::Base.connection.execute(query).to_s;
    #q_percentage_correct = ((num_correct.to_f / total_num.to_f) * 100).to_s
  end
  
  def piece_of_shit
    question_instance = QuestionInstance.last
    #query = "SELECT (COUNT(correct IS TRUE)/(COUNT(correct)+1))*100 as nomzz
            #FROM user_responses 
            #WHERE question_instance_id IN (SELECT id 
                                          #FROM question_instances 
                                          #WHERE question_id = " + question_instance.question_id.to_s + ")"
    query = "SELECT question_instance_id AS nomzz
            FROM user_responses
            WHERE question_instance_id = " + question_instance.id.to_s + ""
    
    results = ActiveRecord::Base.connection.execute(query).to_s;
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
  
  def total_points
    total = UserResponse.where("user_id =" + current_user.id.to_s).sum("award")
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
    responseTotal = UserResponse.where("question_instance_id =" + question_instance.id.to_s).sum(:award)
    
    pointsLeft = total - responseTotal
  end

end
