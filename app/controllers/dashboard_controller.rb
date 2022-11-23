class DashboardController < ApplicationController
  skip_after_action :verify_authorized
  def show
    @bookings_as_owner = current_user.bookings_as_owner
    @bookings_as_renter = current_user.bookings
  end

end
