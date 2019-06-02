class HomeController < ApplicationController

  def index
    @items = Item.all.includes(:images, :categories, :user)
  end

end
