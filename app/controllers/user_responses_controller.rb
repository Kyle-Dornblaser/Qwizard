class UserResponsesController < ApplicationController
  before_action :set_user_response, only: [:show, :edit, :update, :destroy]

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

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user_response
      @user_response = UserResponse.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_response_params
      params.require(:user_response).permit(:response, :award, :question_instance_id, :user_id)
    end
end
