class PostsController < ApplicationController
  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
  end

  def create
    post = Post.new(post_params)
  end
  
  private

  def post_params
    params.require(:post).permit(:title, :content, :category_id, :link, :tag).merge(user_id: current_user.id)
  end

end
