class CategoriesController < ApplicationController
  before_action :authenticate_user! , except: [:show, :index]
  def show
    category = Category.find(params[:id])
  end
  def index
    category = Category.find(params[:id])
    @listings = Listing.where.not(latitude: nil, longitude: nil)
    @lessons = []
    @listings = []
    today = Time.now
    @array = [today, (today + 1.day), (today + 2.day), (today + 3.day), (today + 4.day), (today + 5.day), (today + 6.day)]
    @dayclass = []
    @array.each do |day|
      category.each do |category|
        ordered = category.lessons.order(:start_time)
        @dayclass << ordered.select do |lesson|
          l = lesson.schedule(Time.now)
          if day.day == Time.now.day
            l.occurs_on?(day) && lesson.start_time.hour > Time.now.hour
          else
            l.occurs_on?(day)
          end
        end
      end
    end
    @hash = Gmaps4rails.build_markers(@listings) do |listing, marker|
      marker.lat listing.latitude
      marker.lng listing.longitude
    end
  end
end
