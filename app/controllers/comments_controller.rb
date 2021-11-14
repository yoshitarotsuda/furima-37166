class CommentsController < ApplicationController

  def create
    @comment = Comment.new(comment_params)
    if @comment.save
      redirect_to item_path(params[:item_id])
    end
  end

  private
  def comment_params
    params.permit(:comment).merge(user_id: current_user.id,item_id: params[:item_id])
  end
end