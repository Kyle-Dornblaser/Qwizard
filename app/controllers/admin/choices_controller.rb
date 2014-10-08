class Admin::ChoicesController < ApplicationController
  before_action :set_admin_choice, only: [:show, :edit, :update, :destroy]

  # GET /admin/choices
  # GET /admin/choices.json
  def index
    @admin_choices = Admin::Choice.all
  end

  # GET /admin/choices/1
  # GET /admin/choices/1.json
  def show
  end

  # GET /admin/choices/new
  def new
    @admin_choice = Admin::Choice.new
  end

  # GET /admin/choices/1/edit
  def edit
  end

  # POST /admin/choices
  # POST /admin/choices.json
  def create
    @admin_choice = Admin::Choice.new(admin_choice_params)

    respond_to do |format|
      if @admin_choice.save
        format.html { redirect_to @admin_choice, notice: 'Choice was successfully created.' }
        format.json { render :show, status: :created, location: @admin_choice }
      else
        format.html { render :new }
        format.json { render json: @admin_choice.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /admin/choices/1
  # PATCH/PUT /admin/choices/1.json
  def update
    respond_to do |format|
      if @admin_choice.update(admin_choice_params)
        format.html { redirect_to @admin_choice, notice: 'Choice was successfully updated.' }
        format.json { render :show, status: :ok, location: @admin_choice }
      else
        format.html { render :edit }
        format.json { render json: @admin_choice.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /admin/choices/1
  # DELETE /admin/choices/1.json
  def destroy
    @admin_choice.destroy
    respond_to do |format|
      format.html { redirect_to admin_choices_url, notice: 'Choice was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_admin_choice
      @admin_choice = Admin::Choice.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def admin_choice_params
      params.require(:admin_choice).permit(:choice, :correct_choice, :question_id)
    end
end
