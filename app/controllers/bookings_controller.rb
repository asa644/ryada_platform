class BookingsController < ApplicationController
  before_action :set_booking, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:new]
  before_action :require_permission, only: [:edit, :show]

  # GET /bookings
  # GET /bookings.json
  def new
  end

  # GET /bookings/1
  # GET /bookings/1.json
  def show
  end
  def aboutus

  end
  # GET /bookings/1/edit
  def edit
  end

  # POST /bookings
  # POST /bookings.json
  def create
    @booking = Booking.new(booking_params)
    @booking.user = current_user
    respond_to do |format|
      if @booking.save
        BookingMailer.confirm(@booking).deliver_now
        BookingMailer.confirmation(@booking).deliver_now
        @booking.user.update(phone: @booking.phone)
        format.html { redirect_to @booking, notice: 'booking was successfully created.' }
        format.json { render :show, status: :created, location: @booking }
      else
        format.html { render :new }
        format.json { render json: @booking.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_booking
      @booking = Booking.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def booking_params
      params.require(:booking).permit(:start_time, :day, :lesson_id, :phone)
    end
    def require_permission
      if current_user != Booking.find(params[:id]).user
        redirect_to root_path
        #Or do something else here
      end
    end

end
