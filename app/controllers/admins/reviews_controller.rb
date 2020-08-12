class Admins::ReviewsController < ApplicationController
  before_action :authenticate_admin!

  def index
    @q = Review.ransack(params[:q])
    @reviews = @q.result(distinct: true).order(updated_at: :desc).page(params[:page]).per(10)
  end

  def destroy
    @review = Review.find(params[:id])
    @review.destroy
    redirect_back(fallback_location: root_path)
  end
end
