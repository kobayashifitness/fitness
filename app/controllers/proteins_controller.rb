class ProteinsController < ApplicationController
  before_action :set_protein, only: [:show, :edit, :update, :destroy]

  # GET /proteins
  # GET /proteins.json
  def index
    @proteins = Protein.all
  end

  # GET /proteins/1
  # GET /proteins/1.json
  def show
  end

  # GET /proteins/new
  def new
    @protein = Protein.new
  end

  # GET /proteins/1/edit
  def edit
  end

  # POST /proteins
  # POST /proteins.json
  def create
    @protein = Protein.new(protein_params)
    @protein.user_id = current_user.id

    respond_to do |format|
      if @protein.save
        format.html { redirect_to "/", notice: '日記をつけました。タンパク質を適切に摂取して筋肉を育てよう！' }
        format.json { render action: 'show', status: :created, location: @protein }
      else
        format.html { render action: 'new' }
        format.json { render json: @protein.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /proteins/1
  # PATCH/PUT /proteins/1.json
  def update
    respond_to do |format|
      if @protein.update(protein_params)
        format.html { redirect_to @protein, notice: '日記を更新しました。タンパク質を適切に摂取して筋肉を育てよう！' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @protein.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /proteins/1
  # DELETE /proteins/1.json
  def destroy
    @protein.destroy
    respond_to do |format|
      format.html { redirect_to proteins_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_protein
      @protein = Protein.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def protein_params
      params.require(:protein).permit(:diary_date, :protein_intake)
    end
end
