class CarsController < ApplicationController
  def index
    @cars = Cars.all
  end

  def new
    @car = Car.new
  end

  def create
    @car = Car.new(params_car)
    if @car.save
      redirect_to cars_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
  end

  def edit
  end

  def destroy
  end

  def update
  end

  private

  def params_car
    params.require(:car).permit(:name, :photo)
  end
end
