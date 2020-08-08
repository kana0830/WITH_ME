class CommentsController < ApplicationController
  before_action :authenticate_user!

  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.new(comment_params)
    @comment.user_id = current_user.id
    @comments = @post.comments.all
    if @comment.save
      @post.create_notification_comment(current_user, @comment.id)
      render :create
    else
      @post = Post.find(params[:post_id])
      @comments = @post.comments.all
      render :create
      # render 'posts/show'
    end
  end

  def destroy
    @comment = Comment.find_by(id: params[:id], post_id: params[:post_id])
    @comment.destroy
    render :destroy
  end

  private
  def comment_params
    params.require(:comment).permit(:comment, :post_id)
  end

end
