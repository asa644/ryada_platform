class ListingsController < ApplicationController
  before_action :set_listing, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, only: [:new, :create, :update, :destroy]
  # GET /listings
  # GET /listings.json
  def index
    @listings = Listing.where.not(latitude: nil, longitude: nil)
    @hash = Gmaps4rails.build_markers(@listings) do |listing, marker|
      marker.lat listing.latitude
      marker.lng listing.longitude
      # marker.infowindow render_to_string(partial: "/listings/map_box", locals: { listing: listing })
    end
  end

  # GET /listings/1.
  # GET /listings/1.json
  def show
    @review = Review.new
    @respond = Respond.new
    # @alert_message = "You are viewing #{@listing.name}"
    @listing_coordinates = { lat: @listing.latitude, lng: @listing.longitude }
  end

  def search
    @listings = Listing.algolia_search(params[:search])
  end
  # GET /listings/new
  def new
    @listing = Listing.new
  end

  # GET /listings/1/edit
  def edit
  end

  # POST /listings
  # POST /listings.json
  def create
    @listing = Listing.new(listing_params)
    @listing.user = current_user
    respond_to do |format|
      if @listing.save
        format.html { redirect_to @listing, notice: 'Listing was successfully created.' }
        format.json { render :show, status: :created, location: @listing }
      else
        format.html { render :new }
        format.json { render json: @listing.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /listings/1
  # PATCH/PUT /listings/1.json
  def update
    @listing.user = current_user
    respond_to do |format|
      if @listing.update(listing_params)
        format.html { redirect_to @listing, notice: 'Listing was successfully updated.' }
        format.json { render :show, status: :ok, location: @listing }
      else
        format.html { render :edit }
        format.json { render json: @listing.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /listings/1
  # DELETE /listings/1.json
  def destroy
    @listing.destroy
    respond_to do |format|
      format.html { redirect_to listings_url, notice: 'Listing was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_listing
      @listing = Listing.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def listing_params
      params.require(:listing).permit(:name, :description, :status, :owner_id, :city, :country, :zip_code, :street, :landmark, :phonenumber, :ownerphone, :longitude, :latitude, {photos: []})
    end
end
