class HomesController < ApplicationController


  def index
    t = Time.now
    @date = t.strftime("%Y-%m-%d")

  end

end
