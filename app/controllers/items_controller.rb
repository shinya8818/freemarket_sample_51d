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

  def edit
    @item = Item.find(params[:id])
  end

  def destroy
    item = Item.find(params[:id])
    item.destroy if item.user_id == current_user.id
  end

  def show
  end

  

  private
  def item_params
    params.require(:item).permit(:name,
                              :description,
                              :category_id,
                              :size,
                              :brand,
                              :delivery,
                              :status,
                              :condition,
                              :prefecture, 
                              :shipping_fee,
                              :days,  
                              :fee,
                              :user_id,
                              images_attributes:[:image])
                              # Todo ログイン機能実装後
                              # .merge(user_id: current_user.id)
  end
end
