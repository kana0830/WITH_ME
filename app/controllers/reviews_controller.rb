class ReviewsController < ApplicationController
  before_action :authenticate_user!

  def index
    @gelande = Gelande.find_by(id: params[:gelande_id])
    @review = Review.new
    @reviews = @gelande.reviews.all
  end

  def create
    @gelande = Gelande.find_by(id: params[:gelande_id])
    @review = @gelande.reviews.new(review_params)
    @reviews = @gelande.reviews.all
    if @review.save
      flash[:notice] = '口コミを投稿しました'
      render :create
    else
      @gelande = Gelande.find_by(id: params[:gelande_id])
      @reviews = @gelande.reviews.all
      render 'index'
    end
  end

  def destroy
    @review = Review.find_by(id: params[:id], gelande_id: params[:gelande_id])
    @review.destroy
    render :destroy
  end

  private
    def review_params
      params.require(:review).permit(:title, :star, :review, :gelande_id)
    end
end
