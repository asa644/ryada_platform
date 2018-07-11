class CategoriesController < ApplicationController
  before_action :authenticate_user! , except: [:show, :index]
  def show
    category = Category.find(params[:id])
  end
  def index
    @beirutt = []
    @jouniehh = []
    @matnn = []
    Category.all.each do |category|
      lessons_beirut = Lesson.joins(:listing, :categories)
      .where('listings.city = ? AND categories.name = ?', "Beirut", "#{category.name}")
      lessons_jounieh = Lesson.joins(:listing, :categories)
      .where('listings.city = ? AND categories.name = ?', "Jounieh", "#{category.name}")
      lessons_matn = Lesson.joins(:listing, :categories)
      .where('listings.city = ? AND categories.name = ?', "Matn", "#{category.name}")
      unless lessons_beirut.empty?
        @beirutt << category
      end
      unless lessons_jounieh.empty?
        @jouniehh << category
      end
      unless lessons_matn.empty?
        @matnn << category
      end
    end
    # @beirut= "#{options_from_collection_for_select(beirut, 'id', 'name')}".html_safe
    @beirut = "".html_safe
    @beirutt.each do |option|
      @beirut << "<option value=#{option.id}>#{option.name}</option>".html_safe
    end
    @jounieh = "".html_safe
    @jouniehh.each do |option|
      @jounieh << "<option value=#{option.id}>#{option.name}</option>".html_safe
    end
    @matn = "".html_safe
    @matnn.each do |option|
      @matn << "<option value=#{option.id}>#{option.name}</option>".html_safe
    end

    @booking = Booking.new
    @categories = Category.find(params[:id])
    @s = params[:id]
    # raise 'e'
    # raise
    @location = params[:location]
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
