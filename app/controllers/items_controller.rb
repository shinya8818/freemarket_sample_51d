class ItemsController < ApplicationController
  def new
    @item = Item.new
    @item.images.build
    @item.categories.build
  end

  def create
    @item = Item.new(item_params)
    @image = Image.new(image_params)
    @category = Category.new(category_params)
    binding.pry
    if @item.save && @image.save && @category.save
    else
      render :new
    end
  end

  private
  def item_params
    params.require(:item).permit(:name, :description, :brand, :status, :fee, :condition, :method, :prefecture, :days, :user_id, :size, :shipping_fee)
  end
end
