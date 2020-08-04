class RelationshipsController < ApplicationController
  before_action :authenticate_user!

    # フォローする
    def follow
      @user = User.find(params[:id])
      current_user.follow(params[:id])
      @user.create_notification_follow!(current_user)
      @posts = @user.posts.all
      render :create
    end
  
    # アンフォローする
    def unfollow
      @user = User.find(params[:id])
      @posts = @user.posts.all
      current_user.unfollow(params[:id])
      render :destroy
    end

end

