class PagesController < ApplicationController
  def home
    @cars = params[:query] ? Car.where("name LIKE '%#{params[:query]}%'") : Car.all
  end
end
