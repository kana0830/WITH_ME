class SchedulesController < ApplicationController
  before_action :authenticate_user!

  def new
    @schedule = current_user.schedules.new
  end

  def create
    @schedule = current_user.schedules.new(params_schedule)
    if @schedule.save
      redirect_to @schedule
    else
      render 'new'
    end
  end

  def show
    @schedule = Schedule.find(params[:id])
  end

  def edit
    @schedule = Schedule.find(params[:id])
  end

  def update
    @schedule = Schedule.find(params[:id])
    if @schedule.update(params_schedule)
      redirect_to @schedule
    else
      render 'edit'
    end
  end

  def destroy
    @schedule = Schedule.find(params[:id])
    @schedule.destroy
    redirect_to user_path(current_user)
  end

  private
    def params_schedule
      params.require(:schedule).permit(:title, :content, :start_time, :end_time, :gelande_id)
    end

end
