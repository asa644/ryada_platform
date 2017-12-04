class CategoriesController < ApplicationController
  before_action :authenticate_user!, except: [:show, :index]
  def show
    category = Category.find(params[:id])
  end
  def index
    category = Category.find(params[:id])
    @listings=[]
    category.lessons.each do |lesson|
      l = lesson.listing
      unless l.latitude.nil? && l.longitude.nil?
        @listings << l
      end
    end
    @hash = Gmaps4rails.build_markers(@listings) do |listing, marker|
      marker.lat listing.latitude
      marker.lng listing.longitude
    end
  end
end
