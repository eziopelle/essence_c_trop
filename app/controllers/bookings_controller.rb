class BookingsController < ApplicationController
  before_action :set_car, only: %i[new create]
  def new
    @booking = Booking.new
    @car = Car.find(params[:car_id])
    authorize @booking
  end

  def create
    @booking = Booking.new(booking_params)
    @booking.car = @car
    @booking.user = current_user
    authorize @booking
    if @booking.save
      redirect_to car_path(@car)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @booking = Booking.find(params[:id])
    @car.user = current_user
    authorize @booking
    @booking.destroy
    redirect_to car_path(@booking.car), status: :see_other
  end

  def accept
    authorize @booking
    @status = @booking.status
    @status = 'accepted'
    @booking.save
  end

  def decline
    authorize @booking
    @status = @booking.status
    @status = 'declined'
    @booking.save
  end

  private

  def set_car
    @car = Car.find(params[:car_id])
  end

  def booking_params
    params.require(:booking).permit(:status, :start_date, :end_date, :user_id, :car_id)
  end
end
