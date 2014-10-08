class Admin::QuestionInstancesController < ApplicationController
  before_action :set_admin_question_instance, only: [:show, :edit, :update, :destroy]

  # GET /admin/question_instances
  # GET /admin/question_instances.json
  def index
    @admin_question_instances = Admin::QuestionInstance.all
  end

  # GET /admin/question_instances/1
  # GET /admin/question_instances/1.json
  def show
  end

  # GET /admin/question_instances/new
  def new
    @admin_question_instance = Admin::QuestionInstance.new
  end

  # GET /admin/question_instances/1/edit
  def edit
  end

  # POST /admin/question_instances
  # POST /admin/question_instances.json
  def create
    @admin_question_instance = Admin::QuestionInstance.new(admin_question_instance_params)

    respond_to do |format|
      if @admin_question_instance.save
        format.html { redirect_to @admin_question_instance, notice: 'Question instance was successfully created.' }
        format.json { render :show, status: :created, location: @admin_question_instance }
      else
        format.html { render :new }
        format.json { render json: @admin_question_instance.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /admin/question_instances/1
  # PATCH/PUT /admin/question_instances/1.json
  def update
    respond_to do |format|
      if @admin_question_instance.update(admin_question_instance_params)
        format.html { redirect_to @admin_question_instance, notice: 'Question instance was successfully updated.' }
        format.json { render :show, status: :ok, location: @admin_question_instance }
      else
        format.html { render :edit }
        format.json { render json: @admin_question_instance.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /admin/question_instances/1
  # DELETE /admin/question_instances/1.json
  def destroy
    @admin_question_instance.destroy
    respond_to do |format|
      format.html { redirect_to admin_question_instances_url, notice: 'Question instance was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_admin_question_instance
      @admin_question_instance = Admin::QuestionInstance.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def admin_question_instance_params
      params.require(:admin_question_instance).permit(:question_id)
    end
end
