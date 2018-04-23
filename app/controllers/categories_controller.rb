class CategoriesController < ApplicationController
  before_action :authenticate_user! , except: [:show, :index]
  def show
    category = Category.find(params[:id])
  end
  def index
    @booking = Booking.new
    @categories = Category.find(params[:id])
    @s = params[:id]
    @listings = Listing.where.not(latitude: nil, longitude: nil)
    @lessons = []
    today = Time.now
    @array = [today, (today + 1.day), (today + 2.day), (today + 3.day), (today + 4.day), (today + 5.day), (today + 6.day)]
    @dayclass = []
    @array.each do |day|
      today_classes = []
      @categories.each do |category|
        ordered = Lesson.joins(:listing, :categories)
        .where('listings.city = ? AND categories.name = ?', "#{params[:location]}", "#{category.name}")
        .order(:start_time)
        today_classes << ordered.select do |lesson|
          l = lesson.schedule(Time.now)
          if day.day == Time.now.day
            l.occurs_on?(day) && lesson.start_time.hour > Time.now.hour
          else
            l.occurs_on?(day)
          end
        end
      end
      d = []
      today_classes.each do |cat|
        cat.each do |cla|
          unless d.include?(cla)
            d << cla
          end
        end
      end
      @dayclass << d
    end
  end
end
#
