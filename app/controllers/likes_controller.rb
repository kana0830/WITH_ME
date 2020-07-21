class LikesController < ApplicationController

  def create
    @post = Post.find_by(id: params[:post_id])
    unless @post.liked_by?(current_user)
      @like = current_user.likes.new(post_id: @post.id)
      @like.save
    end
  end

  def destroy
    @post = Post.find_by(id: params[:post_id])
    @like = current_user.likes.find_by(post_id: @post.id)
    @like.destroy
  end

end
