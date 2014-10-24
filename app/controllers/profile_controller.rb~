class ProfileController < ApplicationController

    helper_method :getUserResponses
    
    # GET /profile
    def index
        if !current_user
            redirect_to login_url
        end
    end
    
    private
  
    def getUserResponses
        admin_user_responses = UserResponse.where(:user_id => current_user.id)
        @userResponses = {
            responses: admin_user_responses
        }
    end
end
