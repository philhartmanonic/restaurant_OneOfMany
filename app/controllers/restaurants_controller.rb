class RestaurantsController < ApplicationController
  def new
    @restaurant = Restaurant.new
  end

  def create
    @restaurant = Restaurant.create(restaurant_params)
    if @restaurant.persisted?
      redirect_to(@restaurant)
    else
      render :new
    end
  end

  def show
    @restaurant = Restaurant.find(params.fetch(:id))
  end

  def index
    @restaurants = Restaurant.all
  end

  private

  def restaurant_params
    params.require(:restaurant).permit(
      :name,
      :description,
      :full_address,
      :phone_number
    )
  end
end
