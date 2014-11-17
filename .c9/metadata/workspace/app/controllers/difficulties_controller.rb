{"filter":false,"title":"difficulties_controller.rb","tooltip":"/app/controllers/difficulties_controller.rb","undoManager":{"mark":37,"position":37,"stack":[[{"group":"doc","deltas":[{"action":"removeLines","range":{"start":{"row":0,"column":0},"end":{"row":74,"column":0}},"nl":"\n","lines":["class DifficultiesController < ApplicationController","  before_action :set_difficulty, only: [:show, :edit, :update, :destroy]","","  # GET /difficulties","  # GET /difficulties.json","  def index","    @difficulties = Difficulty.all","  end","","  # GET /difficulties/1","  # GET /difficulties/1.json","  def show","  end","","  # GET /difficulties/new","  def new","    @difficulty = Difficulty.new","  end","","  # GET /difficulties/1/edit","  def edit","  end","","  # POST /difficulties","  # POST /difficulties.json","  def create","    @difficulty = Difficulty.new(difficulty_params)","","    respond_to do |format|","      if @difficulty.save","        format.html { redirect_to @difficulty, notice: 'Difficulty was successfully created.' }","        format.json { render :show, status: :created, location: @difficulty }","      else","        format.html { render :new }","        format.json { render json: @difficulty.errors, status: :unprocessable_entity }","      end","    end","  end","","  # PATCH/PUT /difficulties/1","  # PATCH/PUT /difficulties/1.json","  def update","    respond_to do |format|","      if @difficulty.update(difficulty_params)","        format.html { redirect_to @difficulty, notice: 'Difficulty was successfully updated.' }","        format.json { render :show, status: :ok, location: @difficulty }","      else","        format.html { render :edit }","        format.json { render json: @difficulty.errors, status: :unprocessable_entity }","      end","    end","  end","","  # DELETE /difficulties/1","  # DELETE /difficulties/1.json","  def destroy","    @difficulty.destroy","    respond_to do |format|","      format.html { redirect_to difficulties_url, notice: 'Difficulty was successfully destroyed.' }","      format.json { head :no_content }","    end","  end","","  private","    # Use callbacks to share common setup or constraints between actions.","    def set_difficulty","      @difficulty = Difficulty.find(params[:id])","    end","","    # Never trust parameters from the scary internet, only allow the white list through.","    def difficulty_params","      params.require(:difficulty).permit(:points)","    end","end"]},{"action":"insertText","range":{"start":{"row":0,"column":0},"end":{"row":0,"column":52}},"text":"class DifficultiesController < ApplicationController"},{"action":"insertText","range":{"start":{"row":0,"column":52},"end":{"row":1,"column":0}},"text":"\n"},{"action":"insertLines","range":{"start":{"row":1,"column":0},"end":{"row":81,"column":0}},"lines":["  before_action :set_difficulty, only: [:show, :edit, :update, :destroy]","  before_action :authenticate_admin, only: [:index, :show, :edit, :update, :destroy]","","  # GET /difficulties","  # GET /difficulties.json","  def index","    @difficulties = Difficulty.all","  end","","  # GET /difficulties/1","  # GET /difficulties/1.json","  def show","  end","","  # GET /difficulties/new","  def new","    @difficulty = Difficulty.new","  end","","  # GET /difficulties/1/edit","  def edit","  end","","  # POST /difficulties","  # POST /difficulties.json","  def create","    @difficulty = Difficulty.new(difficulty_params)","","    respond_to do |format|","      if @difficulty.save","        format.html { redirect_to @difficulty, notice: 'Difficulty was successfully created.' }","        format.json { render :show, status: :created, location: @difficulty }","      else","        format.html { render :new }","        format.json { render json: @difficulty.errors, status: :unprocessable_entity }","      end","    end","  end","","  # PATCH/PUT /difficulties/1","  # PATCH/PUT /difficulties/1.json","  def update","    respond_to do |format|","      if @difficulty.update(difficulty_params)","        format.html { redirect_to @difficulty, notice: 'Difficulty was successfully updated.' }","        format.json { render :show, status: :ok, location: @difficulty }","      else","        format.html { render :edit }","        format.json { render json: @difficulty.errors, status: :unprocessable_entity }","      end","    end","  end","","  # DELETE /difficulties/1","  # DELETE /difficulties/1.json","  def destroy","    @difficulty.destroy","    respond_to do |format|","      format.html { redirect_to difficulties_url, notice: 'Difficulty was successfully destroyed.' }","      format.json { head :no_content }","    end","  end","","  private","    # Use callbacks to share common setup or constraints between actions.","    def set_difficulty","      @difficulty = Difficulty.find(params[:id])","    end","","    # Never trust parameters from the scary internet, only allow the white list through.","    def difficulty_params","      params.require(:difficulty).permit(:points)","    end","    ","    def authenticate_admin","      unless current_user && current_user.role =\"admin\"","        redirect_to 'root'","      end","    end","end"]}]}],[{"group":"doc","deltas":[{"action":"removeText","range":{"start":{"row":77,"column":21},"end":{"row":77,"column":22}},"text":"r"}]}],[{"group":"doc","deltas":[{"action":"removeText","range":{"start":{"row":77,"column":21},"end":{"row":77,"column":22}},"text":"o"}]}],[{"group":"doc","deltas":[{"action":"removeText","range":{"start":{"row":77,"column":21},"end":{"row":77,"column":22}},"text":"o"}]}],[{"group":"doc","deltas":[{"action":"removeText","range":{"start":{"row":77,"column":21},"end":{"row":77,"column":22}},"text":"t"}]}],[{"group":"doc","deltas":[{"action":"insertText","range":{"start":{"row":77,"column":21},"end":{"row":77,"column":22}},"text":"/"}]}],[{"group":"doc","deltas":[{"action":"insertText","range":{"start":{"row":76,"column":48},"end":{"row":76,"column":49}},"text":"="}]}],[{"group":"doc","deltas":[{"action":"insertText","range":{"start":{"row":76,"column":49},"end":{"row":76,"column":50}},"text":" "}]}],[{"group":"doc","deltas":[{"action":"insertText","range":{"start":{"row":2,"column":58},"end":{"row":2,"column":59}},"text":" "}]}],[{"group":"doc","deltas":[{"action":"insertText","range":{"start":{"row":2,"column":59},"end":{"row":2,"column":60}},"text":":"}]}],[{"group":"doc","deltas":[{"action":"insertText","range":{"start":{"row":2,"column":60},"end":{"row":2,"column":61}},"text":"n"}]}],[{"group":"doc","deltas":[{"action":"insertText","range":{"start":{"row":2,"column":61},"end":{"row":2,"column":62}},"text":"e"}]}],[{"group":"doc","deltas":[{"action":"insertText","range":{"start":{"row":2,"column":62},"end":{"row":2,"column":63}},"text":"w"}]}],[{"group":"doc","deltas":[{"action":"insertText","range":{"start":{"row":2,"column":63},"end":{"row":2,"column":64}},"text":","}]}],[{"group":"doc","deltas":[{"action":"insertText","range":{"start":{"row":2,"column":64},"end":{"row":2,"column":65}},"text":" "}]}],[{"group":"doc","deltas":[{"action":"removeText","range":{"start":{"row":2,"column":64},"end":{"row":2,"column":65}},"text":" "}]}],[{"group":"doc","deltas":[{"action":"insertText","range":{"start":{"row":2,"column":71},"end":{"row":2,"column":72}},"text":" "}]}],[{"group":"doc","deltas":[{"action":"insertText","range":{"start":{"row":2,"column":72},"end":{"row":2,"column":73}},"text":"c"}]}],[{"group":"doc","deltas":[{"action":"insertText","range":{"start":{"row":2,"column":73},"end":{"row":2,"column":74}},"text":"r"}]}],[{"group":"doc","deltas":[{"action":"insertText","range":{"start":{"row":2,"column":74},"end":{"row":2,"column":75}},"text":"e"}]}],[{"group":"doc","deltas":[{"action":"insertText","range":{"start":{"row":2,"column":75},"end":{"row":2,"column":76}},"text":"a"}]}],[{"group":"doc","deltas":[{"action":"insertText","range":{"start":{"row":2,"column":76},"end":{"row":2,"column":77}},"text":"t"}]}],[{"group":"doc","deltas":[{"action":"insertText","range":{"start":{"row":2,"column":77},"end":{"row":2,"column":78}},"text":"e"}]}],[{"group":"doc","deltas":[{"action":"removeText","range":{"start":{"row":2,"column":77},"end":{"row":2,"column":78}},"text":"e"}]}],[{"group":"doc","deltas":[{"action":"removeText","range":{"start":{"row":2,"column":76},"end":{"row":2,"column":77}},"text":"t"}]}],[{"group":"doc","deltas":[{"action":"removeText","range":{"start":{"row":2,"column":75},"end":{"row":2,"column":76}},"text":"a"}]}],[{"group":"doc","deltas":[{"action":"removeText","range":{"start":{"row":2,"column":74},"end":{"row":2,"column":75}},"text":"e"}]}],[{"group":"doc","deltas":[{"action":"removeText","range":{"start":{"row":2,"column":73},"end":{"row":2,"column":74}},"text":"r"}]}],[{"group":"doc","deltas":[{"action":"removeText","range":{"start":{"row":2,"column":72},"end":{"row":2,"column":73}},"text":"c"}]}],[{"group":"doc","deltas":[{"action":"insertText","range":{"start":{"row":2,"column":72},"end":{"row":2,"column":73}},"text":":"}]}],[{"group":"doc","deltas":[{"action":"insertText","range":{"start":{"row":2,"column":73},"end":{"row":2,"column":74}},"text":"c"}]}],[{"group":"doc","deltas":[{"action":"insertText","range":{"start":{"row":2,"column":74},"end":{"row":2,"column":75}},"text":"r"}]}],[{"group":"doc","deltas":[{"action":"insertText","range":{"start":{"row":2,"column":75},"end":{"row":2,"column":76}},"text":"e"}]}],[{"group":"doc","deltas":[{"action":"insertText","range":{"start":{"row":2,"column":76},"end":{"row":2,"column":77}},"text":"a"}]}],[{"group":"doc","deltas":[{"action":"insertText","range":{"start":{"row":2,"column":77},"end":{"row":2,"column":78}},"text":"t"}]}],[{"group":"doc","deltas":[{"action":"insertText","range":{"start":{"row":2,"column":78},"end":{"row":2,"column":79}},"text":"e"}]}],[{"group":"doc","deltas":[{"action":"insertText","range":{"start":{"row":2,"column":79},"end":{"row":2,"column":80}},"text":","}]}],[{"group":"doc","deltas":[{"action":"removeText","range":{"start":{"row":2,"column":35},"end":{"row":2,"column":99}},"text":", only: [:index, :show, :new, :edit, :create, :update, :destroy]"}]}]]},"ace":{"folds":[],"scrolltop":895,"scrollleft":0,"selection":{"start":{"row":75,"column":4},"end":{"row":79,"column":7},"isBackwards":true},"options":{"guessTabSize":true,"useWrapMode":false,"wrapToView":true},"firstLineState":{"row":53,"state":"start","mode":"ace/mode/ruby"}},"timestamp":1415388459279,"hash":"a55322d6061dbc11e60d4f9ab3e57682d8662b0d"}