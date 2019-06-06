class ItemsController < ApplicationController

  def new
    @item = Item.new
    @item.images.build
    @parents = Category.where(ancestry: nil).order("id ASC")
  end

  def create
    @item = Item.new(item_params)
    binding.pry
    if @item.save
      # Todo モデルに移す 画像保存処理
      params[:item_images]['name'].each do |i|
        @item_image =  @item.images.create!(image: i)
      end
      redirect_to root_path
    else
      render :new
    end
  end

  private
  def item_params
    params.require(:item).permit(:name, :description, :brand, :delivery, :status, :fee, :condition, :prefecture, :days,  :user_id, :size, :shipping_fee, :category_id, images_attributes:[:image])
  end
end
