class ItemsController < ApplicationController

  def new
    @item = Item.new
    @item.images.build
    @parents = Category.where(ancestry: nil).order("id ASC")
    # Todo 以下インスタンスは仮決めのため後ほど削除
    @children = Category.where(id: 30..32)
    render layout: 'another_layout'
  end

  def show
    @item = Item.find(params[:id])
    @comments = @item.comments.includes(:user)
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

  def show
  end

  def buy
    @item = Item.find(params[:id])
    @images = @item.images
    @users = @item.user
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
