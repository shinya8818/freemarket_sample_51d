class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new]
  before_action :set_item, only: [:edit, :destroy] 

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
    @images = @item.images
    @prefecture = Prefecture.find(params[:id])
  end

  def create
    @item = Item.new(item_params)
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


  def destroy
    @item = Item.find params[:id]
    if @item.user_id == current_user.id
      @item.destroy
      redirect_to exhibition_path(current_user.id)
    else
      redirect_to root_path
    end
  end

  def edit
    @parents = Category.where(ancestry: nil).order("id ASC")
    @categories = Category.all
    render layout: 'another_layout'
  end

  def update
    @item = Item.find(params[:id])
    if @item.update(item_params)
      # Todo モデルに移す 画像保存処理
      params[:item_images]['name'].each do |i|
        @item_image =  @item.images.create!(image: i)
      end
      redirect_to item_path(@item)
    end
  end

  def buy
    @item = Item.find(params[:id])
    @images = @item.images
    @users = @item.user
  end

  private
  def set_item
    @item = Item.find(params[:id])
    @item.images.includes(:images).build
  end

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
                                images_attributes:[:image])
                                .merge(user_id: current_user.id)
  end
end
