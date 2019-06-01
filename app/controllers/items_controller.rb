class ItemsController < ApplicationController

  def new
  end

  def show
    @item = Item.find(params[:id])
    @images = @item.images
    @categories = @item.categories
  end

end
