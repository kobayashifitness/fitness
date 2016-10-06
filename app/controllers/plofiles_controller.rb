class PlofilesController < ApplicationController
  before_action :set_plofile, only: [:show, :edit, :update, :destroy]

  # GET /plofiles
  # GET /plofiles.json
  def index
    @plofiles = Plofile.all
  end

  # GET /plofiles/1
  # GET /plofiles/1.json
  def show
  end

  # GET /plofiles/new
  def new
    @plofile = Plofile.new
  end

  # GET /plofiles/1/edit
  def edit
  end

  # POST /plofiles
  # POST /plofiles.json
  def create
    @plofile = Plofile.new(plofile_params)

    respond_to do |format|
      if @plofile.save
        format.html { redirect_to @plofile, notice: 'Plofile was successfully created.' }
        format.json { render action: 'show', status: :created, location: @plofile }
      else
        format.html { render action: 'new' }
        format.json { render json: @plofile.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /plofiles/1
  # PATCH/PUT /plofiles/1.json
  def update
    respond_to do |format|
      if @plofile.update(plofile_params)
        format.html { redirect_to @plofile, notice: 'Plofile was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @plofile.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /plofiles/1
  # DELETE /plofiles/1.json
  def destroy
    @plofile.destroy
    respond_to do |format|
      format.html { redirect_to plofiles_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_plofile
      @plofile = Plofile.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def plofile_params
      params[:plofile]
    end
end
