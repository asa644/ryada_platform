class RespondsController < ApplicationController
  def create
    @respond = Respond.new(respond_params)
    @respond.user = current_user
    @respond.review = Review.find(params[:review_id])
    listing = @respond.review.listing
    if @respond.save
      flash[:notice] = "Thank you"
      redirect_to listing
    else
      render :new
    end
  end

  private
  def respond_params
    params.require(:respond).permit(:content, :review_id)
  end
end

