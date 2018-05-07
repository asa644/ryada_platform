class LandingsController < ApplicationController
  skip_before_action :authenticate_user!
  # , only: [:home]
  def home
    @subscriber = Subscriber.new
    @listings = Listing.all
    @booking = Booking.new
    ordered = Lesson.order(:start_time)
    # beirut = Category.select do |category|
    #   category.lessons.listing.city == "Beirut"
    # end
    # raise 'h'
    # beirut = Category.first(3)
    # jounieh = Category.first(4)
    # @beirut= "#{options_from_collection_for_select(beirut, 'id', 'name')}".html_safe
    @beirut = "".html_safe
    beirut.each do |option|
      @beirut << "<option value=#{option.id}>#{option.name}</option>".html_safe
    end
    @jounieh = "".html_safe
    jounieh.each do |option|
      @jounieh << "<option value=#{option.id}>#{option.name}</option>".html_safe
    end

    @day = Time.now
    @dayclass = ordered.select do |lesson|
      l = lesson.schedule(Time.now)
      if @day.day == Time.now.day
        l.occurs_on?(@day) && lesson.start_time.hour > Time.now.hour
      else
        l.occurs_on?(@day)
      end
    end
    if @dayclass.empty?
      @day += 1.day
      @dayclass = ordered.select do |lesson|
        l = lesson.schedule(Time.now)
        if @day.day == Time.now.day
          l.occurs_on?(@day) && lesson.start_time.hour > Time.now.hour
        else
          l.occurs_on?(@day)
        end
      end
    end
  end
  def notice

  end
end
