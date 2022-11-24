class ReviewsController < ApplicationController
  before_action :set_car, only: %i[show destroy create new]

  def index
    @reviews = Review.all
  end

  def new
    @review = Review.new
    @car = Car.find(params[:car_id])
    authorize @review
  end

  def create
    @review = Review.new(params_review)
    @review.car = @car
    @review.user = current_user
    authorize @review
    if @review.save
      redirect_to cars_path
    else
      render "cars/show", status: :unprocessable_entity
    end

  end

  def show
  end

  def delete
    @review = Review.find(params[:car_id])
    @review.destroy
  end

  private

  def set_car
    @car = Car.find(params[:car_id])
  end

  def params_review
    params.require(:review).permit(:title, :content, :rating, :user_id, :car_id)
  end
end
