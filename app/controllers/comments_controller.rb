class CommentsController < ApplicationController
  before_action :move_to_index, only: :destroy

  def create
    @post = Post.find(params[:post_id])
    @comment = current_user.comments.new(comment_params)
    @comment.post_id = @post.id
    if @comment.save
      render :post_comments
    else
      render :'posts/show'
    end
  end

  def destroy
    Comment.find_by(id: params[:id], post_id: params[:post_id]).destroy
    @post = Post.find(params[:post_id])
    render :post_comments
  end

  private

  def comment_params
    params.require(:comment).permit(:text)
  end

  def move_to_index
    comment = Comment.find(params[:id])
    unless user_signed_in? && current_user.id == comment.user_id
      redirect_to root_path
    end
  end

end
