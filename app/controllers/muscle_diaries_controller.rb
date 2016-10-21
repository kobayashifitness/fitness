class MuscleDiariesController < ApplicationController
  before_action :set_muscle_diary, only: [:show, :edit, :update, :destroy]

  # GET /muscle_diaries
  # GET /muscle_diaries.json
  def index
    @muscle_diaries = MuscleDiary.all
  end

  # GET /muscle_diaries/1
  # GET /muscle_diaries/1.json
  def show
  end

  # GET /muscle_diaries/new
  def new
    @muscle_diary = MuscleDiary.new
  end

  # GET /muscle_diaries/1/edit
  def edit
  end

  # POST /muscle_diaries
  # POST /muscle_diaries.json
  def create
    require 'twitter'	  
    @muscle_diary = MuscleDiary.new(muscle_diary_params)
    @muscle_diary.user_id = current_user.id

    # tweet記述
    auth = request.env["omniauth.auth"]
    
    client = Twitter::REST::Client.new do |config|
      # developer

      config.consumer_key         = "p1kXruMcvR9qzaANAphm3sgav"
      config.consumer_secret      = "rLLYwiOdTqq7HJNoSQLiqhMEQ55IKGriax9mlYKIj3AKGKgXCl"

      #config.consumer_key         = Rails.application.secrets.twitter_consumer_key
      #config.consumer_secret      = Rails.application.secrets.twitter_consumer_secret
      
      # user
      config.access_token         = "hogehoge" 
      config.access_token_secret  = "hogehoge"

      #config.access_token         = auth.credentials.token
      #config.access_token_secret  = auth.credentials.secret
    end
    
    # Twitter投稿
    client.update("test")

    respond_to do |format|
      if @muscle_diary.save
        format.html { redirect_to '/', notice: '日記をつけました。ナイスバルク！' }
        format.json { render action: 'show', status: :created, location: @muscle_diary }
      else
        format.html { render action: 'new' }
        format.json { render json: @muscle_diary.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /muscle_diaries/1
  # PATCH/PUT /muscle_diaries/1.json
  def update
    respond_to do |format|
      if @muscle_diary.update(muscle_diary_params)
        format.html { redirect_to @muscle_diary, notice: '日記を更新しました。ナイスカット！' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @muscle_diary.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /muscle_diaries/1
  # DELETE /muscle_diaries/1.json
  def destroy
    @muscle_diary.destroy
    respond_to do |format|
      format.html { redirect_to muscle_diaries_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_muscle_diary
      @muscle_diary = MuscleDiary.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def muscle_diary_params
      params.require(:muscle_diary).permit(:diary_date, :weight, :num, :set_num, :note)
    end
end
