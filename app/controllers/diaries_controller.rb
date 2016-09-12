class DiariesController < ApplicationController
  before_action :set_diary, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @diaries = Diary.all
    respond_with(@diaries)
  end

  def show
    respond_with(@diary)
  end

  def new
    @diary = Diary.new
    respond_with(@diary)
  end

  def edit
  end

  def create
    @diary = Diary.new(diary_params)
    @diary.save
    respond_with(@diary)
  end

  def update
    @diary.update(diary_params)
    respond_with(@diary)
  end

  def destroy
    @diary.destroy
    respond_with(@diary)
  end

  private
    def set_diary
      @diary = Diary.find(params[:id])
    end

    def diary_params
      params.require(:diary).permit(:weight, :num, :set, :note)
    end
end
