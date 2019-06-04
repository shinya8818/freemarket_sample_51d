class ItemsController < ApplicationController

  def new
    @item = Item.new
    @item.images.build
    @item.categories.build
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      # respond_to do |format|
      #   format.json
      # end
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
    params.require(:item).permit(:name, :description, :brand, :status, :fee, :condition, :method, :prefecture, :days, :user_id, :size, :shipping_fee, categories_attributes:[:name], images_attributes:[:image])
  end

  def show
    @item = Item.find(params[:id])
    @images = @item.images
  end

end
