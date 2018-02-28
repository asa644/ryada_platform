class FeedbacksController < ApplicationController
  skip_before_action :authenticate_user!, only: [:new, :create, :show ]
  def new
    @feedback = Feedback.new
    # @facility = Facility.new
  end
  def create
    @feedback = Feedback.new(feedback_params)
    if @feedback.save
      redirect_to @feedback
    else
      redirect_to root_path
      # alert[:hello]
    end
  end

  def show
    @feedback = Feedback.friendly.find(params[:id])
    # @facility = Facility.new
  end

  private
  def feedback_params
    params.require(:feedback).permit(:name, :email, :message)
  end
end
