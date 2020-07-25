class CommentsController < ApplicationController

  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.new(comment_params)
    @comment.user_id = current_user.id
    if @comment.save
      @post.create_notification_comment!(current_user, @comment.id)
      redirect_to post_path(@post)
    else
      render 'posts/show'
    end
  end

  def destroy
    Comment.find_by(id: params[:id], post_id: params[:post_id]).destroy
    redirect_to post_path(params[:post_id])
  end

  private
    def comment_params
      params.require(:comment).permit(:comment, :post_id)
    end
end
