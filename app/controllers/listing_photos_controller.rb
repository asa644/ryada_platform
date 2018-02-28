class ListingPhotosController < ApplicationController
    before_action :authenticate_user!

  # def new
  #   @story = Story.find(params[:story_id])
  #   @listing_photo = listing_photo.new
  #   authorize @listing_photo
  # end
  def create
    @listing_photo = ListingPhoto.new(listing_photo_params)
    @listing_photo.user = current_user
    if @listing_photo.save
      flash[:notice] = "Thank you"
      redirect_to listing_path(@listing_photo.listing)
    else
      render :new
    end
  end

  private
  def listing_photo_params
    params.require(:listing_photo).permit(:photo, :photo_cache)
  end
end
