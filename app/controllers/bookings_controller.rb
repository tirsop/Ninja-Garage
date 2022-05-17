class BookingsController < ApplicationController
  def index
  end

  def create
    @vehicle = Vehicle.find(params[:vehicle_id])
    @booking = Booking.new(booking_params)
    @booking.user = current_user
    @booking.vehicle = @vehicle
    if @booking.save
      redirect_to vehicle_path(@vehicle)
    else
      render :new
    end
  end

  private

  def booking_params
    params.require(:booking).permit(:start_date, :return_date)
  end
end
