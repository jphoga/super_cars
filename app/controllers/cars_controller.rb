class CarsController < ApplicationController
  before_action :set_car, only: [:show, :destroy]
  skip_before_action :authenticate_user!,only: [:show, :index ]
  def index
    @cars = policy_scope(Car)
    # @cars.order("created_at DESC")
  end

  def new
    @car = Car.new
    authorize @car
  end

  def create
    @car = Car.new(car_params)
    authorize @car

    @car.user = current_user
    if @car.save
      redirect_to car_path(@car)
    else
      render :new
    end
  end

  def show
    @booking = Booking.new
    @unreviewed_bookings = @car.bookings.where.not(id: @car.reviews.pluck(:booking_id).uniq)
    # @car.bookings
    # @booking = Booking.find_by(user: current_user)
    @review = Review.new
  end

  def destroy
    @car.destroy
    redirect_to cars_path
  end

  private

  def set_car
    @car = Car.find(params[:id])
    authorize @car
  end

  def car_params
    params.require(:car).permit(:brand, :model, :mileage, :year, :body_type, :location, :price, :transmission, :photo)
  end
end
