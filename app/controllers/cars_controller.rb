class CarsController < ApplicationController
  before_action :set_car, only: [:show, :destroy]
  skip_before_action :authenticate_user!,only: [:show, :index ]

  def index
    skip_policy_scope
    if params[:start].present? && params[:end].present?
      # cars = Car.search_by_car(params[:query])
      # # @cars.order("created_at DESC")

      # car_arr = []
      # cars.each do |car|
      #   car.bookings.each do |booking|
      #     if booking.start_date > params[:end] || booking.end_date < params[:start]
      #       car_arr << car
      #     end
      #   end
      # end
      # @cars = car_arr.uniq
      @cars = Car.joins(:bookings).group("cars.id").where("cars.location ILIKE :query AND (bookings.start_date > :end OR bookings.end_date < :start)",
                                                          query: params[:query], end: params[:end], start: params[:start])
    elsif params[:query].present?
      @cars = Car.search_by_car(params[:query])
    else
      @cars = Car.all
    end
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
      respond_to do |format|
        format.json { render :show, status: :created, location: @car }
        format.html
      end
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

    @unreviewed_bookings = @car.unreviewed_bookings
    # @car.bookings
    # @booking = Booking.find_by(user: current_user)
    @review = Review.new

    #calculate average rating
    sum = 0
    count = 0
    @car.reviews.each do |review|
      count += 1
      sum += review.rating
    end
    if sum == 0
      @average_rating = 0
    else
      @average_rating = sum / count
    end
  end

  def destroy
    @car.destroy

    respond_to do |format|
      format.html { redirect_to cars_url, notice: 'Car was successfully destroyed.' }
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
