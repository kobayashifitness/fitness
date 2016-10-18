class HomesController < ApplicationController
  before_action :authenticate_user!

  def index

    @year_goal = current_user.goals.where(span: 'year' ).last
    @month_goal = current_user.goals.where(span: 'month').last
    @week_goal = current_user.goals.where(span: 'week').last
    if @year_goal == nil
      @year_goal = Goal.new
      @year_goal.user_id = current_user.id
      @year_goal.goal = "今年の目標を設定してください"
    end
    if @month_goal == nil
      @month_goal = Goal.new
      @month_goal.user_id = current_user.id
      @month_goal.goal = "今月の目標を設定してください"
    end
    if @week_goal == nil
      @week_goal = Goal.new
      @week_goal.user_id = current_user.id
      @week_goal.goal = "今年の目標を設定してください"
    end

    t = Time.now
    @date = t.strftime("%Y-%m-%d")

    @goal = Goal.new
    @muscle_diary = MuscleDiary.new
    @muscle_mass = MuscleMass.new
    @height = Height.new
    @weight = Weight.new
  end

 def diary
   @date = params[:date]
 end
end
