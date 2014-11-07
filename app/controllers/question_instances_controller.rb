class QuestionInstancesController < ApplicationController
  before_action :set_question_instance, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_admin

  # GET /question_instances
  # GET /question_instances.json
  def index
    @question_instances = QuestionInstance.all
  end

  # GET /question_instances/1
  # GET /question_instances/1.json
  def show
  end

  # GET /question_instances/new
  def new
    @question_instance = QuestionInstance.new
  end

  # GET /question_instances/1/edit
  def edit
  end

  # POST /question_instances
  # POST /question_instances.json
  def create
    @question_instance = QuestionInstance.new(question_instance_params)

    respond_to do |format|
      if @question_instance.save
        format.html { redirect_to @question_instance, notice: 'Question instance was successfully created.' }
        format.json { render :show, status: :created, location: @question_instance }
      else
        format.html { render :new }
        format.json { render json: @question_instance.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /question_instances/1
  # PATCH/PUT /question_instances/1.json
  def update
    respond_to do |format|
      if @question_instance.update(question_instance_params)
        format.html { redirect_to @question_instance, notice: 'Question instance was successfully updated.' }
        format.json { render :show, status: :ok, location: @question_instance }
      else
        format.html { render :edit }
        format.json { render json: @question_instance.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /question_instances/1
  # DELETE /question_instances/1.json
  def destroy
    @question_instance.destroy
    respond_to do |format|
      format.html { redirect_to question_instances_url, notice: 'Question instance was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_question_instance
      @question_instance = QuestionInstance.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def question_instance_params
      params.require(:question_instance).permit(:question_id)
    end
    
    def authenticate_admin
      unless current_user && current_user.role == "admin"
        redirect_to '/'
      end
    end
end

