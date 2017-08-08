class ReviewsController < ApplicationController
  def create
    @review = Review.new(reviews_params)
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
  def reviews_params
    params.require(:review).permit(:star, :description, :listing_id)
  end
end
