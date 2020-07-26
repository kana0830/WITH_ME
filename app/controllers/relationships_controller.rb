class RelationshipsController < ApplicationController

    # フォローする
    def follow
      @user = User.find(params[:id])
      current_user.follow(params[:id])
      @user.create_notification_follow!(current_user)
      redirect_back(fallback_location: root_path)
    end
  
    # アンフォローする
    def unfollow
      current_user.unfollow(params[:id])
      redirect_back(fallback_location: root_path)
    end
end

