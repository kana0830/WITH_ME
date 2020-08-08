class PostsController < ApplicationController
  before_action :authenticate_user!

  def index
    @q = Post.ransack(params[:q])
    @posts = @q.result(distinct: true).order(updated_at: :desc)
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
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    if @post.update(task_params)
      flash[:notice] = '投稿しました'
      redirect_to post_path(@post)
    else
      render 'edit'
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to posts_path
  end

  def autocomplete
    all_tags = Post.tag_counts_on(:tags) #全てのタグを取得
    tags_name = all_tags.where('name LIKE(?)', "#{params[:term]}%").pluck(:name) #tagsテーブルのnameカラムを前方一致で取得
    render json: tags_name.to_json #前方一致で取得した値をjsonにする
  end


  private
    def task_params
      params.require(:post).permit(:title, :post, :tag_list) 
      #tag_list を追加
    end

end
