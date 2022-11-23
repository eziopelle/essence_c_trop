class DashboardController < ApplicationController
  skip_after_action :verify_authorized
  def show
    @bookings_as_owner = current_user.bookings_as_owner
    @bookings_as_renter = current_user.bookings
  end

  def accept
    @booking = Booking.find(params[:booking])
    @booking.status = 'accepted'
    @booking.save
    redirect_to dashboard_path
  end

  def decline
    @booking = Booking.find(params[:booking])
    @booking.status = 'declined'
    @booking.save
    redirect_to dashboard_path
  end
end
