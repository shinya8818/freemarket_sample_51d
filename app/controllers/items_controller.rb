class ItemsController < ApplicationController

  def new
  end

  def show
    @item = Item.find(params[:id])
    @images = @item.images
    @comments = @item.comments.includes(:user)
  end

end
