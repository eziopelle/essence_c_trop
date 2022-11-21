class BookingsController < ApplicationController
  before_action :set_car, only: %i[new create]
  def new
    @booking = Booking.new
  end

  def create
    @booking = Booking.new(booking_params)
    @booking.car = @car
    if @booking.save
      redirect_to car_path(@car)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @booking = Booking.find(params[:id])
    @booking.destroy
    redirect_to car_path(@booking.car), status: :see_other
  end

  def accept
    @status = @booking.status
    @status = 'true'
  end

  def decline
    @status = @booking.status
    @status = 'false'
  end

  private

  def set_car
    @car = Car.find(params[:car_id])
  end

  def booking_params
    params.require(:booking).permit(:status, :start_date, :end_date, :user_id, :car_id)
  end
end
