class Admin::DifficultiesController < ApplicationController
  before_action :set_admin_difficulty, only: [:show, :edit, :update, :destroy]

  # GET /admin/difficulties
  # GET /admin/difficulties.json
  def index
    @admin_difficulties = Admin::Difficulty.all
  end

  # GET /admin/difficulties/1
  # GET /admin/difficulties/1.json
  def show
  end

  # GET /admin/difficulties/new
  def new
    @admin_difficulty = Admin::Difficulty.new
  end

  # GET /admin/difficulties/1/edit
  def edit
  end

  # POST /admin/difficulties
  # POST /admin/difficulties.json
  def create
    @admin_difficulty = Admin::Difficulty.new(admin_difficulty_params)

    respond_to do |format|
      if @admin_difficulty.save
        format.html { redirect_to @admin_difficulty, notice: 'Difficulty was successfully created.' }
        format.json { render :show, status: :created, location: @admin_difficulty }
      else
        format.html { render :new }
        format.json { render json: @admin_difficulty.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /admin/difficulties/1
  # PATCH/PUT /admin/difficulties/1.json
  def update
    respond_to do |format|
      if @admin_difficulty.update(admin_difficulty_params)
        format.html { redirect_to @admin_difficulty, notice: 'Difficulty was successfully updated.' }
        format.json { render :show, status: :ok, location: @admin_difficulty }
      else
        format.html { render :edit }
        format.json { render json: @admin_difficulty.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /admin/difficulties/1
  # DELETE /admin/difficulties/1.json
  def destroy
    @admin_difficulty.destroy
    respond_to do |format|
      format.html { redirect_to admin_difficulties_url, notice: 'Difficulty was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_admin_difficulty
      @admin_difficulty = Admin::Difficulty.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def admin_difficulty_params
      params.require(:admin_difficulty).permit(:points)
    end
end
