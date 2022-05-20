class BookingsController < ApplicationController
  def index
    @bookings = policy_scope(Booking)
  end

  def create
    @vehicle = Vehicle.find(params[:vehicle_id])
    @booking = Booking.new(booking_params)
    @booking.user = current_user
    @booking.vehicle = @vehicle

    authorize @booking
    if @booking.save
      redirect_to bookings_path
    else
      render "vehicles/show"
    end
  end

  def update
    @booking = Booking.find(params[:id])
    authorize @booking
    if @booking.update(booking_params)
      respond_to do |format|
        format.html { redirect_to owner_bookings_path(anchor: "booking-#{@booking.id}"), notice: 'Booking was succesfully updated.' }
        format.js # look for a JS view with the same action name
      end
    else
      render :edit
    end
  end

  private

  def booking_params
    params.require(:booking).permit(:start_date, :return_date, :status)
  end
end
