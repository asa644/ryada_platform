class AttendeesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :new, :create, :show]

  def new
    @attendee = Attendee.new
  end
  def create
    @attendee = Attendee.new(attendee_params)
    if @attendee.save
      redirect_to @attendee
    else
      redirect_to root_path
    end
  end

  def show
    @event = Event.where(happening: true).first
    @attendee = Attendee.friendly.find(params[:id])
    # @feedback = Feedback.new
  end
  private
  def attendee_params
    params.require(:attendee).permit(:name, :email, :phonenumber, :event_id)
  end
end
