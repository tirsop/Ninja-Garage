class VehiclesController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[index show]
  def index
    @vehicles = Vehicle.all
  end

  def show
  end

  def new
  end

  def create
  end
end
