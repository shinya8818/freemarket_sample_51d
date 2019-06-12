class LikesController < ApplicationController

  before_action :get_item

  def create
    @like = Like.new(user_id: current_user.id, item_id: params[:item_id])
    if @like.save
      @likes = Like.where(item_id: params[:item_id])
    else
      redirect_to item_path
  end

  def destroy
    @like = Like.find_by(user_id: current_user.id, item_id: params[:item_id])
    @like.destroy
    @likes = Like.where(item_id: params[:item_id])
  end

  def get_item
    @item = Item.find(params[:item_id])
  end
end
