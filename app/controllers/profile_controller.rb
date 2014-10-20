class ProfileController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  helper_method :current_user, :percentage_correct, :getUserResponses
  private

  def current_user
    @current_users ||= User.find(session[:user_id]) if session[:user_id]
  end

    def getUserResponses
        admin_user_responses = UserResponse.where(:user_id => current_user.id)
        @userResponses = {
            responses: admin_user_responses
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

end
