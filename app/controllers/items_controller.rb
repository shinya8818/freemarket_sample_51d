class ItemsController < ApplicationController

  def new
  end

  def show
    @item = Item.find(params[:id])
    @images = @item.images
  end

  def buy
    @item = Item.find(params[:id])
    @images = @item.images
    @users = @item.user
  end

end
