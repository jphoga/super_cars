class BookingsController < ApplicationController
  before_action :set_booking, only: [:show, :destroy]
  def index
    @bookings = policy_scope(Booking).order("created_at DESC")
  end

  def create
    @car = Car.find(params[:car_id])
    @booking = Booking.new(booking_params)
    @booking.car = @car
    authorize @booking
    @booking.user = current_user
    if @booking.save
      redirect_to booking_path(@booking)
    else
      render "cars/show"
    end
  end

  def show
    @review = Review.new
  end

  def destroy
    @booking.destroy
    redirect_to bookings_path
  end

  private

  def set_booking
    @booking = Booking.find(params[:id])
    authorize @booking
  end

  def booking_params
    params.require(:booking).permit(:start_date, :end_date)
  end

end
