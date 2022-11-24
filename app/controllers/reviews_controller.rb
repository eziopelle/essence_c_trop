class ReviewsController < ApplicationController
  before_action :set_car, only: %i[show destroy]

  def index
    @reviews = Review.all
  end

  def new
  end

  def create
  end

  def show
  end

  def delete
  end

  private

  def set_review
    @review = Review.find(params[:id])
  end

  def params_review
    params.require(:car).permit(:content, :rating)
  end
end
