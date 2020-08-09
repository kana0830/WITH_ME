class Admins::ReviewsController < ApplicationController
  before_action :authenticate_admin!

  def index
    @q = Review.ransack(params[:q])
    @reviews = @q.result(distinct: true).page(params[:page]).per(10)
  end
end
