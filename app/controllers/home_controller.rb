class HomeController < ApplicationController

  def index
    @items = Item.where.not(status: 3).includes(:user, :images)
  end

end
