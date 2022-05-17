class VehiclesController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[index show]
  def index
    @vehicles = Vehicle.all
  end

  def show
  end

  def new
    @vehicle = Vehicle.new
  end

  def create
    @vehicle = Vehicle.new(vehicle_params)
    @vehicle.user = current_user
    if @vehicle.save
      redirect_to vehicle_path(@vehicle)
    else
      render :new
    end
  end

  private

  def vehicle_params
    params.require(:vehicle).permit(:brand, :model, :category, :description, :price, :location)
  end
end
