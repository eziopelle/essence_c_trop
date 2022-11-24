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
      sleep 3
      redirect_to dashboard_path
    else
      render "cars/show", status: :unprocessable_entity
    end
  end

  def destroy
    @booking = Booking.find(params[:id])
    @booking.user = current_user
    authorize @booking
    @booking.destroy
    redirect_to '/dashboard', status: :see_other
  end

  private

  def set_car
    @car = Car.find(params[:car_id])
  end

  def booking_params
    params.require(:booking).permit(:status, :start_date, :end_date, :user_id, :car_id)
  end
end
