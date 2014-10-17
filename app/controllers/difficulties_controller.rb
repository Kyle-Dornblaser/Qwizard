class DifficultiesController < ApplicationController
  before_action :set_difficulty, only: [:show, :edit, :update, :destroy]

  # GET /difficulties
  # GET /difficulties.json
  def index
    @difficulties = Difficulty.all
  end

  # GET /difficulties/1
  # GET /difficulties/1.json
  def show
  end

  # GET /difficulties/new
  def new
    @difficulty = Difficulty.new
  end

  # GET /difficulties/1/edit
  def edit
  end

  # POST /difficulties
  # POST /difficulties.json
  def create
    @difficulty = Difficulty.new(difficulty_params)

    respond_to do |format|
      if @difficulty.save
        format.html { redirect_to @difficulty, notice: 'Difficulty was successfully created.' }
        format.json { render :show, status: :created, location: @difficulty }
      else
        format.html { render :new }
        format.json { render json: @difficulty.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /difficulties/1
  # PATCH/PUT /difficulties/1.json
  def update
    respond_to do |format|
      if @difficulty.update(difficulty_params)
        format.html { redirect_to @difficulty, notice: 'Difficulty was successfully updated.' }
        format.json { render :show, status: :ok, location: @difficulty }
      else
        format.html { render :edit }
        format.json { render json: @difficulty.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /difficulties/1
  # DELETE /difficulties/1.json
  def destroy
    @difficulty.destroy
    respond_to do |format|
      format.html { redirect_to difficulties_url, notice: 'Difficulty was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_difficulty
      @difficulty = Difficulty.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def difficulty_params
      params.require(:difficulty).permit(:points)
    end
end
