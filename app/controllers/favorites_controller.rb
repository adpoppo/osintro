class FavoritesController < ApplicationController
  before_action :set_post
  before_action :authenticate_user!

  def create
    if @post.user_id != current_user.id
      @favorite = Favorite.create(user_id: current_user.id, post_id: @post.id)
      redirect_to post_path(@post)
    end
  end

  def destroy
    @favorite = Favorite.find_by(user_id: current_user.id, post_id: @post.id)
    @favorite.destroy
    redirect_to post_path(@post)
  end

  private

  def set_post
    @post = Post.find(params[:post_id])
  end

end
