class CommentsController < ApplicationController

  def create
    @comment = Comment.new(content: comment_params[:content], item_id: comment_params[:item_id], user_id: current_user.id)
    @comment.save if @comment.content
    redirect_to "/items/#{@comment.item.id}"
  end

  private
  def comment_params
    params.permit(:content, :item_id)
  end

end
