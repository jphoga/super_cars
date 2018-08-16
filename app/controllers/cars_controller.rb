class CarsController < ApplicationController
  before_action :set_car, only: [:show, :destroy]
  skip_before_action :authenticate_user!,only: [:show, :index ]
  def index
    # @cars.order("created_at DESC")

    @cars = policy_scope(Car)

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
      format.json { render :show, status: :created, location: @car }

    else
      render :new
      format.json { render json: @car.errors, status: :unprocessable_entity }

    end
  end

  def show
    @booking = Booking.new

    @markers = [
      {
        lat: @car.latitude,
        lng: @car.longitude,
        infoWindow: { content: render_to_string(partial: "/cars/map_box", locals: { car: @car }) }
      }]

  end

  def destroy
    @car.destroy
    respond_to do |format|
      format.html { redirect_to flats_url, notice: 'Flat was successfully destroyed.' }
      format.json { head :no_content }
    end
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
