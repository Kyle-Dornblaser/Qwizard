class Admin::UserResponsesController < ApplicationController
  before_action :set_admin_user_response, only: [:show, :edit, :update, :destroy]

  # GET /admin/user_responses
  # GET /admin/user_responses.json
  def index
    @admin_user_responses = Admin::UserResponse.all
  end

  # GET /admin/user_responses/1
  # GET /admin/user_responses/1.json
  def show
  end

  # GET /admin/user_responses/new
  def new
    @admin_user_response = Admin::UserResponse.new
  end

  # GET /admin/user_responses/1/edit
  def edit
  end

  # POST /admin/user_responses
  # POST /admin/user_responses.json
  def create
    @admin_user_response = Admin::UserResponse.new(admin_user_response_params)

    respond_to do |format|
      if @admin_user_response.save
        format.html { redirect_to @admin_user_response, notice: 'User response was successfully created.' }
        format.json { render :show, status: :created, location: @admin_user_response }
      else
        format.html { render :new }
        format.json { render json: @admin_user_response.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /admin/user_responses/1
  # PATCH/PUT /admin/user_responses/1.json
  def update
    respond_to do |format|
      if @admin_user_response.update(admin_user_response_params)
        format.html { redirect_to @admin_user_response, notice: 'User response was successfully updated.' }
        format.json { render :show, status: :ok, location: @admin_user_response }
      else
        format.html { render :edit }
        format.json { render json: @admin_user_response.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /admin/user_responses/1
  # DELETE /admin/user_responses/1.json
  def destroy
    @admin_user_response.destroy
    respond_to do |format|
      format.html { redirect_to admin_user_responses_url, notice: 'User response was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_admin_user_response
      @admin_user_response = Admin::UserResponse.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def admin_user_response_params
      params.require(:admin_user_response).permit(:response, :award, :question_instance_id, :user_id)
    end
end
