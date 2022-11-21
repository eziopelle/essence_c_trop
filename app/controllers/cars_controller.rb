class CarsController < ApplicationController
  def index
    @cars = Car.all
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
    @car = Car.find(params[:id])
  end

  def edit
  end

  def destroy
    @car = Car.find(params[:id])
    @car.destroy
  end

  def update
    @article = Article.find(params[:id])
    @article.update(article_params)
    redirect_to article_path(@article)
  end

  private

  def params_car
    params.require(:car).permit(:name, :model, :color, :city, :price, :autonomy, :kilometreage)
  end
end
