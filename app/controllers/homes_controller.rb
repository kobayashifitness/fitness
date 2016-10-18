class HomesController < ApplicationController
  before_action :authenticate_user!

  def index

    @year_goal = current_user.goals.where(span: 'year' ).last
    @month_goal = current_user.goals.where(span: 'month').last
    @week_goal = current_user.goals.where(span: 'week').last

    t = Time.now
    @date = t.strftime("%Y-%m-%d")

    @muscle_diary = MuscleDiary.new
    @muscle_mass = MuscleMass.new
    @height = Height.new
    @weight = Weight.new
  end

 def diary
   @date = params[:date]
 end
end
