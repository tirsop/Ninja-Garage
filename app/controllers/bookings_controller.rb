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
      # render "vehicles/show"
      redirect_to vehicle_path(@vehicle), notice: @booking.errors.messages[:return_date].first
    end
  end

  def update
    @booking = Booking.find(params[:id])
    authorize @booking
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
