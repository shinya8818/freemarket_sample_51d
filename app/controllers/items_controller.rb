class ItemsController < ApplicationController
  def new
    @item = Item.new
    @image = Image.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
    else
      render :new
    end
  end

  private
  def item_params
    params.require(:item).permit(:name, :description)
  end
end
