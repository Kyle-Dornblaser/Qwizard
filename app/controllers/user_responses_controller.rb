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
      choices = Choice.where(:question_id => @user_response.question_instance.question_id)
      correct_response = ''
      choices.each do |choice|
        if choice.correct_choice
          correct_response = choice
        end
      end
      if @user_response.response == correct_response.choice
        @user_response.award = (current_pool * 0.26).ceil
        msg = "Correct"
      else
        @user_response.award = 0
        msg = "Incorrect"
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
