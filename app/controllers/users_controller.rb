class UsersController < ApplicationController
  before_action :authenticate_user!

  def show
    @user = current_user
  end

  def dashboard
    @user = current_user
    # @parking_spots = @user.parking_spots
    # @segment = ParkingSpot.paginate(:page => params[:page], :per_page => 4)
  end
  def profile
    @user = current_user
  end
end
