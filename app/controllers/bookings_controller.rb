class BookingsController < ApplicationController
  def index
    @bookings = Booking.all
    # How to scope bookings to show only the current user's bookings??
    # pundit or devise
  end

  def create
    @vehicle = Vehicle.find(params[:vehicle_id])
    @booking = Booking.new(booking_params)
    @booking.user = current_user
    @booking.vehicle = @vehicle
    if @booking.save
      redirect_to bookings_path
    else
      render :new
    end
  end

  def update
    @booking = Booking.find(params[:id])
    if @booking.update(booking_params)
      redirect_to owner_bookings_path, notice: 'Booking was succesfully updated.'
    else
      render :edit
    end
  end

  private

  def booking_params
    params.require(:booking).permit(:start_date, :return_date, :status)
  end
end
