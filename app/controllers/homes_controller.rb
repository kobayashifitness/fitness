class HomesController < ApplicationController
  before_action :authenticate_user!

  def index
    @year_goal = current_user.goals.where(span: 'year' ).last
    @month_goal = current_user.goals.where(span: 'month').last
    @week_goal = current_user.goals.where(span: 'week').last
  end

 def diary

 end
end
