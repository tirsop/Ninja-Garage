class ReviewsController < ApplicationController
  def create
    @review = Review.new(review_params)
    @review.user = current_user
    @vehicle = Vehicle.find(params[:vehicle_id])
    @review.vehicle = @vehicle
    authorize @review
    if @review.save
      redirect_to vehicle_path(@vehicle)
    else
      render :new
    end
  end

  private

  def review_params
    params.require(:review).permit(:rating, :content)
  end
end
