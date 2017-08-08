class RespondsController < ApplicationController
  def create
    @respond = Respond.new(respond_params)
    @respond.user = current_user
    review = Review.find(params[:review_id])
    @respond.review = review
    if @respond.save
      flash[:notice] = "Thank you"
      redirect_to listing_path(review.listing)
    else
      render :new
    end
  end

  private
  def respond_params
    params.require(:responds).permit(:description, :review_id)
  end
end
