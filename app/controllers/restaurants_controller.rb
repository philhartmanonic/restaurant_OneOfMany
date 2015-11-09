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

  def edit
    @restaurant = Restaurant.find(params.fetch(:id))
  end

  def update
    @restaurant = Restaurant.find(params.fetch(:id))
    if @restaurant.update_attributes(restaurant_params)
      redirect_to(@restaurant)
    else
      render :edit
    end
  end

  def destroy
    @restaurant = Restaurant.find(params.fetch(:id))
    @restaurant.destroy if @restaurant
    redirect_to restaurants_path
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
