class CommentsController < ApplicationController
  before_action :move_to_index, only: :destroy

  def create
    comment = Comment.new(comment_params)
    comment.save
    redirect_to post_path(comment.post.id)
  end

  def destroy
    comment = Comment.find_by(id: params[:id], post_id: params[:post_id])
    comment.destroy
    redirect_to post_path(comment.post.id)
  end

  private

  def comment_params
    params.require(:comment).permit(:text).merge(user_id: current_user.id, post_id: params[:post_id])
  end

  def move_to_index
    comment = Comment.find(params[:id])
    unless user_signed_in? && current_user.id == comment.user_id
      redirect_to root_path
    end
  end

end
