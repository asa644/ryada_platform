class ReviewsController < ApplicationController
  # def new
  #   @story = Story.find(params[:story_id])
  #   @review = review.new
  #   authorize @review
  # end

  def create
    @review = Review.new(review_params)
    @review.user = current_user
    @review.listing = Listing.find(params[:listing_id])
    if @review.save
      flash[:notice] = "Thank you"
      redirect_to listing_path(@review.listing)
    else
      render :new
    end
  end

  private
  def review_params
    params.require(:review).permit(:description, :rating, :listing_id)
  end
end

