class PagesController < ApplicationController
  def home
    @car = policy_scope(Car)
    @cars = params[:query] ? Car.where("model LIKE '%#{params[:query]}%'") : Car.all
    @markers = @cars.geocoded.map do |car|
      {
        lat: car.latitude,
        lng: car.longitude
      }
    end
    @cars = Car.last(3)
  end
end
