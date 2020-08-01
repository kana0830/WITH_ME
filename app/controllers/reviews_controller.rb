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
    @review.save
      flash[:notice] = '口コミを投稿しました'
      redirect_to gelande_reviews_path(@gelande)
    # else
    #   @gelande = Gelande.find_by(id: params[:gelande_id])
    #   @reviews = @gelande.reviews.all
    #   render 'index'
    # end
  end

  def destroy

  end

  private
    def review_params
      params.require(:review).permit(:title, :star, :review, :gelande_id)
    end
end
