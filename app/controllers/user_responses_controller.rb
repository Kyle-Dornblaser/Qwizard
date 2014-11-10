class UserResponsesController < ApplicationController
  before_action :set_user_response, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_admin, except: [:evaluateResponse]

  # GET /user_responses
  # GET /user_responses.json
  def index
    @user_responses = UserResponse.all
  end

  # GET /user_responses/1
  # GET /user_responses/1.json
  def show
  end

  # GET /user_responses/new
  def new
    @user_response = UserResponse.new
  end

  # GET /user_responses/1/edit
  def edit
  end

  # POST /user_responses
  # POST /user_responses.json
  def create
    @user_response = UserResponse.new(user_response_params)

    respond_to do |format|
      if @user_response.save
        format.html { redirect_to @user_response, notice: 'User response was successfully created.' }
        format.json { render :show, status: :created, location: @user_response }
      else
        format.html { render :new }
        format.json { render json: @user_response.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /user_responses/1
  # PATCH/PUT /user_responses/1.json
  def update
    respond_to do |format|
      if @user_response.update(user_response_params)
        format.html { redirect_to @user_response, notice: 'User response was successfully updated.' }
        format.json { render :show, status: :ok, location: @user_response }
      else
        format.html { render :edit }
        format.json { render json: @user_response.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /user_responses/1
  # DELETE /user_responses/1.json
  def destroy
    @user_response.destroy
    respond_to do |format|
      format.html { redirect_to user_responses_url, notice: 'User response was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  # POST /evaluate_response
  def evaluateResponse
    @user_response = UserResponse.new(user_response_params)

    # TODO Refactor into logged in check method
    if @user_response.user == nil
      @user_response.destroy
      respond_to do |format|
        format.html { redirect_to signup_url, notice: "Must be logged in participate" }
      end
    else
      # TODO Get question type and have the method for that question type evaluate the response
      question = Question.find(@user_response.question_instance.question_id)
      
      # call methods related to question_type
      case question.question_type
      when 1
        msg = evaluate_multiple_choice
      when 2
        msg = evaluate_multiple_select
      when 3
        msg = evaluate_short_answer
      else msg = "INCORRECT"
      end

      respond_to do |format|
        if @user_response.save
          format.html { redirect_to root_url, notice: msg }
          format.json { render :show, status: :created, location: @user_response }
        else
          format.html { render :new }
          format.json { render json: @user_response.errors, status: :unprocessable_entity }
        end
      end
    end
  end

  def evaluate_multiple_choice
    choices = Choice.where(:question_id => @user_response.question_instance.question_id)
    correct_response = ''
    choices.each do |choice|
      if choice.correct_choice
        correct_response = choice
      end
    end
    
    if @user_response.response == correct_response.choice
      @user_response.award = (current_pool * 0.26).ceil
      "Correct!!"
    else
      @user_response.award = 0
      "INCORRECT"
    end
  end
  
  def evaluate_multiple_select
    choices = Choice.where(:question_id => @user_response.question_instance.question_id)
    all_correct = true #boolean for whether the user's checks are all correct and not missing a correct choice
    
    #params[:checked_answers] is an array of all the checkboxes the user selected; it does not include unchecked boxes
    choices.each do |choice|
        if (choice.correct_choice)
            if !(params[:checked_answers].include? choice.choice)
                all_correct = false
            end
        else
            if (params[:checked_answers].include? choice.choice)
                all_correct = false
            end
        end
    end
    
    #Sets the user's response, each choice delineated by vertical bars (|)
    checked_responses = ""
    params[:checked_answers].length.times do |i|
        checked_responses += params[:checked_answers][i]
        if i < params[:checked_answers].length - 1
            checked_responses += "|"
        end
    end
    @user_response.response = checked_responses
    
    if (all_correct)
        @user_response.award = (current_pool * 0.26).ceil
        "CORRECTTTTTT"
    else
        @user_response.award = 0
        "WROOOOONG"
    end
  end
  
  def evaluate_short_answer
    choices = Choice.where(:question_id => @user_response.question_instance.question_id)
    correct_answer = true
    choices.each do |choice|
        if (params[:short_ans].casecmp choice.choice) != 0
            correct_answer = false
        end
    end
    
    @user_response.response = params[:short_ans]
    if correct_answer
        @user_response.award = (current_pool * 0.26).ceil
        "YESSSSSS"
    else
        @user_response.award = 0
        "NOOOOOOOO"
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user_response
      @user_response = UserResponse.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_response_params
      params.require(:user_response).permit(:response, :award, :question_instance_id, :user_id)
    end
    
    def authenticate_admin
      unless current_user && current_user.role == "admin"
        redirect_to '/'
      end
    end
end
