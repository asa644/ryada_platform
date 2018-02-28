class CategoriesController < ApplicationController
  before_action :authenticate_user!
  # , except: [:show, :index]
  def show
    category = Category.find(params[:id])
  end
  def index
    category = Category.find(params[:id])
    @listings=[]
    @lessons = []
    category.lessons.each do |lesson|
      l = lesson.listing
      unless l.latitude.nil? && l.longitude.nil?
        @lessons << lesson
        @listings << l
      end
    end
    # @hash = Gmaps4rails.build_markers(@listings) do |listing, marker|
    #   marker.lat listing.latitude
    #   marker.lng listing.longitude
    # end
  end
end
  # def index
  #   @listings = Listing.where.not(latitude: nil, longitude: nil)
  #   @lessons = []
  #   Lesson.all.each do |lesson|
  #     unless lesson.listing.latitude.nil? && lesson.listing.longitude.nil?
  #       @lessons << lesson
  #     end
  #   end
  #   @hash = Gmaps4rails.build_markers(@listings) do |listing, marker|
  #     marker.lat listing.latitude
  #     marker.lng listing.longitude
  #   end
  # end
