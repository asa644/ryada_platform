class LandingsController < ApplicationController
  skip_before_action :authenticate_user!
  # , only: [:home]
  def home
    @subscriber = Subscriber.new
    @listings = Listing.all
    @booking = Booking.new
    ordered = Lesson.order(:start_time)
    beirut = []
    jounieh = []
    matn = []
    Category.all.each do |category|
      lessons_beirut = Lesson.joins(:listing, :categories)
      .where('listings.city = ? AND categories.name = ?', "Beirut", "#{category.name}")
      lessons_jounieh = Lesson.joins(:listing, :categories)
      .where('listings.city = ? AND categories.name = ?', "Jounieh", "#{category.name}")
      lessons_matn = Lesson.joins(:listing, :categories)
      .where('listings.city = ? AND categories.name = ?', "Matn", "#{category.name}")
      unless lessons_beirut.empty?
        beirut << category
      end
      unless lessons_jounieh.empty?
        jounieh << category
      end
      unless lessons_matn.empty?
        matn << category
      end
    end
    # @beirut= "#{options_from_collection_for_select(beirut, 'id', 'name')}".html_safe
    @beirut = "".html_safe
    beirut.each do |option|
      @beirut << "<option value=#{option.id}>#{option.name}</option>".html_safe
    end
    @jounieh = "".html_safe
    jounieh.each do |option|
      @jounieh << "<option value=#{option.id}>#{option.name}</option>".html_safe
    end
    @matn = "".html_safe
    matn.each do |option|
      @matn << "<option value=#{option.id}>#{option.name}</option>".html_safe
    end
# raise 'e'
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
  def yoga
    @pdf = Pdf.first.attachment
   # @pdf = File.read(Rails.root.join('lib', 'seeds', 'booking_2.pdf'))
  end
end
