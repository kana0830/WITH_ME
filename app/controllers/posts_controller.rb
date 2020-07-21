class PostsController < ApplicationController
  def index
    @q = current_user.posts.ransack(params[:q])
    @posts = @q.result(distinct: true)
    @user = current_user
    if params[:tag_name]
      @posts = Post.tagged_with("#{params[:tag_name]}")
    end
  end

  def new
    @post = current_user.posts.build
  end

  def create
    @post = current_user.posts.build(task_params)
    if @post.save
      flash[:notice] = '投稿しました'
      redirect_to post_path(@post)
    else
      render 'new'
    end
  end

  def show
    @post = Post.find(params[:id])
    @comment = Comment.new
    @comments = @post.comments.all
  end

  def edit
    @post = current_user.posts.find(params[:id])
  end

  def update
    @post = current_user.posts.find(params[:id])
    if @post.update(task_params)
      flash[:notice] = '投稿しました'
      redirect_to post_path(@post)
    else
      render 'edit'
    end
  end

  def destroy
    @post = current_user.posts.find(params[:id])
    @post.destroy
  end


  private

    def task_params
      params.require(:post).permit(:title, :post, :tag_list) 
      #tag_list を追加
    end
end
