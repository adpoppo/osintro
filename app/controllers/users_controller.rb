class UsersController < ApplicationController
  before_action :set_user

  def show
    @following_users = @user.following_user
    @follower_users = @user.follower_user
    @posts = @user.posts.page(params[:page]).reverse_order.per(3)
    favorites = Favorite.where(user_id: @user.id).pluck(:post_id)
    @favorite_list = Post.find(favorites)
  end

  def follows
    @users = @user.following_user.page(params[:page]).per(3).reverse_order
  end
  
  def followers
    @users = @user.follower_user.page(params[:page]).per(3).reverse_order
  end

  def favorites
    @fav_posts = @user.fav_posts.page(params[:page]).per(5).reverse_order
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

end
