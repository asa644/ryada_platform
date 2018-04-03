class SubscribersController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :create, :show, :home, :urban, :community, :events, :about, :attend ]

  def new
    @subscriber = Subscriber.new
  end
  def attend
    @event = Event.where(happening: true).first
    @attendee = @event.attendees.new
  end
  def urban
    @event = Event.where(happening: true).first
    @attendee = Attendee.new
    @feedback = Feedback.new
  end
  def home
    @attendee = Attendee.new
    @feedback = Feedback.new
    @subscriber = Subscriber.new
  end
  def community
    @feedback = Feedback.new
  end
  def events
    @event = Event.where(happening: true).first
    @events = Event.where(happening: false)
    @feedback = Feedback.new
  end
  def about
  end

  def create
    @subscriber = Subscriber.new(subscriber_params)
    if @subscriber.save
      SubscriberMailer.welcome(@subscriber).deliver_now
      redirect_to @subscriber
    else
      redirect_to root_path
      # alert[:hello]
    end
  end
  def show
    @subscriber = Subscriber.friendly.find(params[:id])
    # @facility = Facility.new
    @feedback = Feedback.new

  end

  private
  def subscriber_params
    params.require(:subscriber).permit(:name, :email)
  end
end
