class LandingsController < ApplicationController
  skip_before_action :authenticate_user!
  # , only: [:home]
  def home
    @listings = Listing.all
    @booking = Booking.new
    ordered = Lesson.order(:start_time)
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
      raise @dayclass
      @day = DateTime.tomorrow
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
end
