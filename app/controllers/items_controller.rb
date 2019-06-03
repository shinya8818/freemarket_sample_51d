class ItemsController < ApplicationController
  def new
    @item = Item.new
    @item.images.build
    @item.categories.build
  end

  def create
    binding.pry
    @item = Item.new(item_params)
    binding.pry
    if @item.save
    else
      render :new
    end
  end

  private
  def item_params
    params.require(:item).permit(:name, :description, :brand, :status, :fee, :condition, :method, :prefecture, :days, :user_id, :size, :shipping_fee, categories_attributes:[:name], images_attributes:[:image])
  end
end
