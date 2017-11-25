class CategoriesController < ApplicationController
  before_action :authenticate_user!, except: [:show]
  def show
    category = Category.find(params[:id])
    @listings=[]
    category.lessons.each do |lesson|
      @listings << lesson.listing.where.not(latitude: nil, longitude: nil)
    end
    @hash = Gmaps4rails.build_markers(@listings) do |listing, marker|
      marker.lat listing.latitude
      marker.lng listing.longitude
    end
  end
end
