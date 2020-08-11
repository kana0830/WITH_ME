class RoomsController < ApplicationController
  before_action :authenticate_user!

  def create
    @room = Room.create
    @entry1 = Entry.create(room_id: @room.id, user_id: current_user.id)
    @entry2 = Entry.create((entry_params).merge(room_id: @room.id))
    redirect_to room_path(@room)
  end

  def index
    @rooms = current_user.rooms.order(updated_at: :desc).page(params[:page]).per(10)
  end

  def show
    @room = Room.find(params[:id])
    if Entry.where(user_id: current_user.id,room_id: @room.id).present?
      @messages = @room.messages
      @message = Message.new
      @entries = @room.entries
    else
      redirect_back(fallback_location: root_path)
    end
  end

  def following
    @user = User.find(params[:user_id])
    @followings = @user.following_user
  end

  private
  def entry_params
    params.require(:entry).permit(:user_id, :room_id)
  end

end
