class UsersController < ApplicationController
  def index
    @q = User.ransack(params[:q])
    @users = @q.result(distinct: true)
  end

  def show
    @user = User.find(params[:id])
    @posts = @user.posts.all
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      flash[:notice] = 'プロフィールを更新しました'
      redirect_to user_path(@user)
    else
      render 'edit'
    end
  end

  def exit
    @user = User.find(params[:id])
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    redirect_to root_path
  end

  # 自分がフォローしているユーザー一覧
  def following
    @user = User.find(params[:user_id])
    @followings = @user.following_user.where.not(id: current_user.id)
  end

  # 自分をフォローしているユーザー一覧
  def follower
    @user = User.find(params[:user_id])
    @followers = @user.follower_user.where.not(id: current_user.id)
  end

  private
    def user_params
      params.require(:user).permit(:name, :email, :encrypted_password, :image_id, :gender, :address, :age, :favorite_id, :introduction, :is_active)
    end
end
