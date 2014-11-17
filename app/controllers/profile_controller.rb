class ProfileController < ApplicationController

    helper_method :getUserResponses, :countUniqueQuestions
    
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
    
    def countUniqueQuestions
        unique_questions = Hash.new(0)
        getUserResponses[:responses].each do |user_response|
            unique_questions[user_response.question_instance.question.id] = 1
        end
        unique_questions.length
    end
end
