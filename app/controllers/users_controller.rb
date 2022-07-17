class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
    @following_users = @user.following_user
    @follower_users = @user.follower_user
    @posts = @user.posts.page(params[:page]).reverse_order.per(3)
    favorites = Favorite.where(user_id: @user.id).pluck(:post_id)
    @favorite_list = Post.find(favorites)
  end

  def follows
    user = User.find(params[:id])
    @users = user.following_user.page(params[:page]).per(3).reverse_order
  end
  
  def followers
    user = User.find(params[:id])
    @users = user.follower_user.page(params[:page]).per(3).reverse_order
  end

  def favorites
    @user = User.find(params[:id])
    @fav_posts = @user.fav_posts.page(params[:page]).per(5).reverse_order
  end

end
