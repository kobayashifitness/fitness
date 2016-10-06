class MuscleDialiesController < ApplicationController
  before_action :set_muscle_dialy, only: [:show, :edit, :update, :destroy]

  # GET /muscle_dialies
  # GET /muscle_dialies.json
  def index
    @muscle_dialies = MuscleDialy.all
  end

  # GET /muscle_dialies/1
  # GET /muscle_dialies/1.json
  def show
  end

  # GET /muscle_dialies/new
  def new
    @muscle_dialy = MuscleDialy.new
  end

  # GET /muscle_dialies/1/edit
  def edit
  end

  # POST /muscle_dialies
  # POST /muscle_dialies.json
  def create
    @muscle_dialy = MuscleDialy.new(muscle_dialy_params)

    respond_to do |format|
      if @muscle_dialy.save
        format.html { redirect_to @muscle_dialy, notice: 'Muscle dialy was successfully created.' }
        format.json { render action: 'show', status: :created, location: @muscle_dialy }
      else
        format.html { render action: 'new' }
        format.json { render json: @muscle_dialy.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /muscle_dialies/1
  # PATCH/PUT /muscle_dialies/1.json
  def update
    respond_to do |format|
      if @muscle_dialy.update(muscle_dialy_params)
        format.html { redirect_to @muscle_dialy, notice: 'Muscle dialy was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @muscle_dialy.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /muscle_dialies/1
  # DELETE /muscle_dialies/1.json
  def destroy
    @muscle_dialy.destroy
    respond_to do |format|
      format.html { redirect_to muscle_dialies_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_muscle_dialy
      @muscle_dialy = MuscleDialy.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def muscle_dialy_params
      params[:muscle_dialy]
    end
end
