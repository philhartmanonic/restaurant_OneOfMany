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
    @restaurant = fetch_restaurant_by_id
  end

  def edit
    @restaurant = fetch_restaurant_by_id
  end

  def update
    @restaurant = fetch_restaurant_by_id
    if @restaurant.update_attributes(restaurant_params)
      redirect_to(@restaurant)
    else
      render :edit
    end
  end

  def destroy
    @restaurant = fetch_restaurant_by_id
    @restaurant.destroy if @restaurant
    redirect_to restaurants_path
  end

  def index
    @restaurants = Restaurant.all
  end

  private

  def fetch_restaurant_by_id
    Restaurant.find(params.fetch(:id))
  end

  def restaurant_params
    params.require(:restaurant).permit(
      :name,
      :description,
      :full_address,
      :phone_number
    )
  end
end
