class ListingsController < ApplicationController
  before_action :set_listing, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, only: [:new, :create, :update, :destroy, :edit]
  # GET /listings
  # GET /listings.json
  def hi
  end
  def index
    @booking = Booking.new
    @listings = Listing.where.not(latitude: nil, longitude: nil)
    @lessons = []
    today = Time.now
    @array = [today, (today + 1.day), (today + 2.day), (today + 3.day), (today + 4.day), (today + 5.day), (today + 6.day)]
    @dayclass = []
    @array.each do |day|
      ordered = Lesson.order(:start_time)
      @dayclass << ordered.select do |lesson|
        l = lesson.schedule(Time.now)
        if day.day == Time.now.day
          l.occurs_on?(day) && lesson.start_time.hour > Time.now.hour
        else
          l.occurs_on?(day)
        end
      end
    end
    @hash = Gmaps4rails.build_markers(@listings) do |listing, marker|
      marker.lat listing.latitude
      marker.lng listing.longitude
    end
  end
  def pendings
    @listings = Listing.where(status: 'pending')
  end
  def approve
    @listing = Listing.find(params[:listing_id])
    @listing.update(status: 'accepted')
    @listing.owner
    redirect_to listing_path(@listing)
  end
  def disapprove
    @listing = Listing.find(params[:listing_id])
    @listing.update(status: 'rejected')
    redirect_to listing_path(@listing)

  end
  # GET /listings/1.
  # GET /listings/1.json
  def show
    @review = Review.new
    @respond = Respond.new
    @booking = Booking.new
    # @alert_message = "You are viewing #{@listing.name}"
    @listing_coordinates = { lat: @listing.latitude, lng: @listing.longitude }
    # @calendar_lessons = @listing.lessons.each{ |e| e.calendar_lessons(e.start_time)}
    @hash = Gmaps4rails.build_markers([@listing]) do |listing, marker|
      marker.lat listing.latitude
      marker.lng listing.longitude
    end
    @events = []
    min = DateTime.now
    max = DateTime.now+2.hours
    unless @listing.lessons.nil?
      @listing.lessons.each do |event|
        @calendar_lessons = event.calendar_lessons(DateTime.now)
        # unless @calendar_lessons.nil?
        #   @calendar_lessons.each do |lesson|
        #       if lesson.start_time < min
        #         min = lesson.start_time
        #       end
        #       if lesson.start_time > max
        #         max = lesson.start_time
        #       end
        #       @events << {id: lesson.id ,title:  "#{lesson.name}", start: lesson.start_time, end: lesson.start_time+1.hours, allDay: false}
        #   end
        # end
      end
    end
    @min = min
    @max = max + 2.hours
    # raise 'e'
  end

  def search
    @listings = Listing.algolia_search(params[:search])
  end
  # GET /listings/new
  def new
    @listing = Listing.new
    @categories = Category.all
    @days = ['Monday', 'Tuesday', 'Wednsday', 'Thursday', 'Friday', 'Saturday', 'Sunday']
    @listing_photo = @listing.listing_photos.build
    @listing.timings.build
    @listing_photo.user = current_user
    # @listing.lessons.build
    # raise 'he'
  end

  # GET /listings/1/edit
  def edit
    @categories = Category.all
    @days = ['Monday', 'Tuesday', 'Wednsday', 'Thursday', 'Friday', 'Saturday', 'Sunday']

  end

  # POST /listings
  # POST /listings.json
  def create
    @listing = Listing.new(listing_params)
    @listing.user = current_user
    @listing.owner = current_user
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
      params.require(:listing).permit(:id, :name, :categories_ids,:description, :status, :owner_id, :city, :country, :zip_code, :street, :landmark, :phonenumber, :ownerphone, :longitude, :latitude, listing_photos_attributes: [:id, :user_id, :photo, :photo_cache], timings_attributes: [:id, :day, :start_time, :end_time, :status], lessons_attributes: [:id, :name, :price, :description, :start_time, :end_time, :recurring, :_destroy, category_ids: []])
    end
end
