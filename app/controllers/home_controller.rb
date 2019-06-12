class HomeController < ApplicationController

  def index
    @items = Item.all.includes(:images, :user)
  end

end
