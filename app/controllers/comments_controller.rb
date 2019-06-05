class CommentsController < ApplicationController

  def create
    @comment = Comment.create(content: comment_params[:content], item_id: comment_params[:item_id], user_id: comment_params[:user_id])
    redirect_to "/items/#{comment.item.id}"
  end

  private
  def comment_params
    params.permit(:content, :item_id, :user_id)
  end

end
