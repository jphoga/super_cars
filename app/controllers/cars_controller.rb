class CarsController < ApplicationController
  before_action :set_cocktail, only: [:show, :destroy]
  def index
    @cars = Car.all
  end

  def new
    @car = Car.new
  end

  def create
    @car = Car.new(car_params)
    @car.user = current_user
    if @car.save
      redirect_to car_path(@car)
    else
      render :new
    end
  end

  def show
  end

  def destroy
    @car.destroy
    redirect_to cars_path
  end

  private

  def set_cocktail
    @car = Car.find(params[:id])
  end

  def car_params
    params.require(:car).permit(:brand, :model, :mileage, :year, :body_type, :location, :price, :transmission)
  end
end
