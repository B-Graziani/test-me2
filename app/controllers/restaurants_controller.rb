class RestaurantsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]
  def index
    @restaurants = policy_scope(Restaurant)
  end
  def show
    @restaurant = Restaurant.find(params[:id])
    authorize @restaurant
  end
  def chef_name
    @restaurant = Restaurant.find(params[:id])
  end
  def top
    @restaurants = Restaurant.where(stars: 5)
    authorize @restaurant
  end
  def new
    @restaurant = Restaurant.new
    authorize @restaurant
  end
  def create
    @restaurant = Restaurant.new(restaurant_params)
    @restaurant.user = current_user

    if @restaurant.save
      redirect_to @restaurant
    else
      render :new
    end
    authorize @restaurant
  end
  def edit
    @restaurant = Restaurant.find(params[:id])
    authorize @restaurant
  end
  def update
    @restaurant = Restaurant.find(params[:id])
    @restaurant.update(restaurant_params)
    authorize @restaurant
    redirect_to @restaurant
  end
  def destroy
    @restaurant = Restaurant.find(params[:id])
    @restaurant.destroy
    redirect_to restaurants_path
    authorize @restaurant
  end

  private

  def restaurant_params
    params.require(:restaurant).permit(:name, :address, :chef_name, :stars)
  end
end
