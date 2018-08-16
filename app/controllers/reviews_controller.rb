class ReviewsController < ApplicationController
  before_action :set_review, only: [:show, :destroy]
  before_action :set_booking, only: [:index, :create]
  def index
    @reviews = policy_scope(Review).order("created_at DESC")
  end

  def create
    @review = Review.new(review_params)
    @review.booking = @booking
    @review.user = current_user
    authorize @review
    if @review.save
      redirect_to car_path(@booking.car)
    else
      render "cars/show"
    end
  end

  def show
  end

  def destroy
    @review.destroy
    redirect_to reviews_path

  end

  private

  def set_booking
    @booking = Booking.find(params[:booking_id])
  end

  def set_review
    @review = Review.find(params[:id])
    authorize @review
  end

  def review_params
    params.require(:review).permit(:rating, :content)
  end
end
