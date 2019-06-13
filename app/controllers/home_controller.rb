class HomeController < ApplicationController

  def index
    @items = Item.all.includes(:user, :images)
  end

end
