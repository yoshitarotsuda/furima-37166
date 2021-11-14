class CommentsController < ApplicationController

  def create
    @comment = Comment.new(comment_params)
    if @comment.save
      redirect_to item_path(params[:item_id])
    end
  end

  def destroy # 追加実装では確認ボタン、確認ページを設けることを考慮
    comment = Comment.find(params[:id])
    if current_user.id == comment[:user_id]
      comment.destroy
      redirect_to item_path(params[:item_id])
    end
  end

  private
  def comment_params
    params.permit(:comment).merge(user_id: current_user.id,item_id: params[:item_id])
  end
end