class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :check_guest, only: %i[update destroy]

  def index
    @q = User.ransack(params[:q])
    @users = @q.result(distinct: true).order(updated_at: :desc).page(params[:page]).per(9)
  end

  def show
    @user = User.find(params[:id])
    @posts = @user.posts.all.page(params[:page]).per(9)
    @current_user_entry = Entry.where(user_id: current_user.id)
    @user_entry = Entry.where(user_id: @user.id)
    @schedules = @user.schedules
    @schedule = @user.schedules.new
    if @user.id != current_user.id
      @current_user_entry.each do |cu|
        @user_entry.each do |u|
          if cu.room_id == u.room_id then
            @is_room = true
            @room_id = cu.room_id
          end
        end
      end
      unless @is_room
        @room = Room.new
        @entry = Entry.new
      end
    end
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
    @followings = @user.following_user
  end

  # 自分をフォローしているユーザー一覧
  def follower
    @user = User.find(params[:user_id])
    @followers = @user.follower_user
  end

  def check_guest
    user = User.find(params[:id])
    if user.email == 'test@example.com'
      redirect_to root_path, alert: 'ゲストユーザーの変更・削除はできません。'
    end
  end

  private
  def user_params
    params.require(:user).permit(:name, :email, :encrypted_password, :image, :gender, :address, :age, :introduction, :is_active, { :gelande_ids=> [] })
  end

end
