class GraphsController < ApplicationController
  before_action :authenticate_user!

  respond_to :html

  def index
    @weights = Weight.all
    @max_weight = @weights.maximum('weight')
    @min_weight = @weights.minimum('weight')
    #@graph = @weights.map{|w| [w.diary_date, w.weight]} # weights内の個々のweightについて[日付，体重]の配列にマッピング
    @graph = @weights.pluck(:diary_date, :weight) # pluckの方がよかった
  end

end
