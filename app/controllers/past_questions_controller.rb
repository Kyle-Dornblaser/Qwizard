class PastQuestionsController < ApplicationController
    before_action :set_past_question, only: [:show]
    helper_method :current_question, :past_question_leaderboard
    
    # GET /past
    def index
        @past_questions = QuestionInstance.order('id DESC')
        @current_question = QuestionInstance.last
    end
    
    def show
        @past_question_instance = QuestionInstance.find(params[:id])
        @question = Question.find(set_past_question.question_id)
        @choices = Choice.where(:question_id => @question.id)
    end
    
    private
    
    def past_question_leaderboard(question_instance)
        query = "SELECT users.username, MAX(user_responses.award) AS award 
             FROM users JOIN user_responses 
             ON users.id = user_responses.user_id 
             WHERE question_instance_id = " + question_instance.id.to_s + " 
             GROUP BY users.username 
             ORDER BY MAX(user_responses.award) DESC"
        results = ActiveRecord::Base.connection.execute(query);
    end
    
    # Use callbacks to share common setup or constraints between actions.
    def set_past_question
      @past_question = QuestionInstance.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def question_params
      params.require(:question_instance).permit(:question)
    end
        
    def current_question
        QuestionInstance.last
    end
end
