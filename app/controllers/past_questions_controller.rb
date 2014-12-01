class PastQuestionsController < ApplicationController
    before_action :set_past_question, only: [:show]
    helper_method :current_question
    
    # GET /past
    def index
        @past_questions = QuestionInstance.all
        @current_question = QuestionInstance.last
    end
    
    def show
        
        @question = Question.find(set_past_question.question_id)
        @choices = Choice.where(:question_id => @question.id)
    end
    
    private
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
