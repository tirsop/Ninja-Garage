class ReviewsController < ApplicationController
  def create
    @review = Review.new(review_params)
    @review.user = current_user
    @vehicle = Vehicle.find(params[:vehicle_id])
    @review.vehicle = @vehicle
    authorize @review
    if @review.save
      respond_to do |format|
        format.html { redirect_to vehicle_path(@review.vehicle, anchor: "review-#{@review.id}") }
        format.js # look for a JS view with the same action name
      end
    else
      render :new
    end
  end

  private

  def review_params
    params.require(:review).permit(:rating, :content)
  end
end
