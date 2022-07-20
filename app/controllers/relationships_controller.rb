class RelationshipsController < ApplicationController
  before_action :set_user
  
  def create
    current_user.follow(params[:user_id])
    render :create
  end
  
  def destroy
    current_user.unfollow(params[:user_id])
    render :destroy
  end

  private

  def set_user
    @user = User.find(params[:user_id])
    @following_users = @user.following_user
    @follower_users = @user.follower_user
  end
  
end
