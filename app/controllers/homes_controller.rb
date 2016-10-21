class HomesController < ApplicationController
  before_action :authenticate_user!

  def index

    @year_goal = current_user.goals.where(span: 'year' ).last
    @month_goal = current_user.goals.where(span: 'month').last
    @week_goal = current_user.goals.where(span: 'week').last
    if @year_goal == nil
      @year_goal = Goal.new
      @year_goal.user_id = current_user.id
      @year_goal.goal = "今年の目標を設定しましょう"
    end
    if @month_goal == nil
      @month_goal = Goal.new
      @month_goal.user_id = current_user.id
      @month_goal.goal = "今月の目標を設定しましょう"
    end
    if @week_goal == nil
      @week_goal = Goal.new
      @week_goal.user_id = current_user.id
      @week_goal.goal = "今週の目標を設定しましょう"
    end

    t = Time.now
    @date = t.strftime("%Y-%m-%d")
    # 目標
    @goal = Goal.new
    # トレーニング
    @muscle_diary = MuscleDiary.new
    @muscle_diary.weight =0
    @event= Event.new
    # プロフィール
    @muscle_mass = MuscleMass.new
    @height = Height.new
    @weight = Weight.new
    @protein = Protein.new
    #筋肉コンディション

    @mune = current_user.muscle_diaries.joins({:event => :muscles}).where(:muscles => {:part => '胸'}).last
    @senaka = current_user.muscle_diaries.joins({:event => :muscles}).where(:muscles => {:part => '背中'}).last
    @kata = current_user.muscle_diaries.joins({:event => :muscles}).where(:muscles => {:part => '肩'}).last
    @nitou = current_user.muscle_diaries.joins({:event => :muscles}).where(:muscles => {:part => '上腕二頭筋'}).last
    @santou = current_user.muscle_diaries.joins({:event => :muscles}).where(:muscles => {:part => '上腕三頭筋'}).last
    @ab = current_user.muscle_diaries.joins({:event => :muscles}).where(:muscles => {:part => '腹筋'}).last
    @asi = current_user.muscle_diaries.joins({:event => :muscles}).where(:muscles => {:part => '足'}).last
    @hukurahagi = current_user.muscle_diaries.joins({:event => :muscles}).where(:muscles => {:part => 'ふくらはぎ'}).last
    @zenwan = current_user.muscle_diaries.joins({:event => :muscles}).where(:muscles => {:part => '前腕部'}).last
    if(@mune != nil)
      @mune = @mune.diary_date
    else
      @mune = DateTime.now - 10.days
    end

    if(@senaka != nil)
      @senaka = @senaka.diary_date
    else
      @senaka = DateTime.now - 10.days
    end

    if(@kata != nil)
      @kata = @kata.diary_date
    else
      @kata = DateTime.now - 10.days
    end

    if(@nitou != nil)
      @nitou = @nitou.diary_date

    else
      @nitou = DateTime.now - 10.days
    end

    if(@santou != nil)
      @santou = @santou.diary_date
    else
      @santou = DateTime.now - 10.days
    end

    if(@ab != nil)
      @ab = @ab.diary_date
    else
      @ab = DateTime.now - 10.days
    end

    if(@asi != nil)
      @asi = @asi.diary_date
    else
      @asi = DateTime.now - 10.days
    end

    if(@hukurahagi != nil)
      @hukurahagi = @hukurahagi.diary_date
    else
      @hukurahagi = DateTime.now - 10.days
    end

    if(@zenwan != nil)
      @zenwan = @zenwan.diary_date
    else
      @zenwan = DateTime.now - 10.days
    end

    @event_suggestions = Event.autocomplete(params[:term]).pluck(:event_name)
     respond_to do |format|
       format.html
       format.json {
         render json: @event_suggestions
       }
     end
  end


 def diary
   @date = params[:date]
   @diaries = current_user.muscle_diaries.where(diary_date: @date ).all
 end

 def diary_all
   @all_diary = current_user.muscle_diaries.all
 end

 def wiki
   @events = Event.all
   @muscles = Muscle.all
 end

end
