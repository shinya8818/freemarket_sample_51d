class HomeController < ApplicationController

  def index
    @items = Item.all.includes(:image, :user)
  end

end
