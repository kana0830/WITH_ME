class RelationshipsController < ApplicationController
  before_action :authenticate_user!

  # フォローする
  def follow
    @user = User.find(params[:id])
    current_user.follow(params[:id])
    @user.create_notification_follow(current_user)
    @posts = @user.posts.all
    redirect_back(fallback_location: root_path)
  end

  # アンフォローする
  def unfollow
    @user = User.find(params[:id])
    @posts = @user.posts.all
    current_user.unfollow(params[:id])
    redirect_back(fallback_location: root_path)
  end

end

