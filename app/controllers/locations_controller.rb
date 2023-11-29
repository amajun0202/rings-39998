class LocationsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :destroy]

  def index
    
  end

  def new
    @location=Location.new
  end

  def create
    @location=Location.new(location_params)
    if @location.save
      redirect_to root_path
    else
      render :new, status: :unprocessable_entity  
    end
  end

  private

  def location_params
    params.require(:location).permit(:meal_enter_id, :requires_id, :title, :estimated_time, :cost, :description, :address, :phone_number, :nearest_station, :travel_time, :business_hours, :official_url, {images: []}).merge(user_id: current_user.id)
  end

  def location_params_up 
    params.require(:location).permit(:meal_enter_id, :requires_id, :title, :estimated_time, :cost, :description, :address, :phone_number, :nearest_station, :travel_time, :business_hours, :official_url, {images: []})
  end

end
