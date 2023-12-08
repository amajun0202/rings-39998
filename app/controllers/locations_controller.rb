class LocationsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :destroy, :edit]
 

  def index
    @locations = Location.limit(12).order("created_at DESC")
    
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

  def show
    @location = Location.find(params[:id])
    @comment = Comment.new
    @comments = @location.comments.includes(:user)
  end

  def edit
    @location = Location.find(params[:id])
  end

  def update  
    @location = Location.find(params[:id])
  if @location.update(location_params_up )
    redirect_to location_path(@location.id)
  else
    render :edit, status: :unprocessable_entity
  end
end

def destroy
  @location = Location.find(params[:id])
  if current_user.id == @location.user.id
  @location.destroy
  redirect_to root_path
  end
end

  def search
    @locations = Location.search(params[:keyword])
  end

  def random
     
    @key = params[:key]
    @key_b = params[:key_b]
    @search = params[:search]
    @locations = random_items_by_meal_enter(@search,@key, @key_b)
    
  end

  private

  def location_params
    params.require(:location).permit(:meal_enter_id, :requires_id, :title, :estimated_time, :max_cost, :min_cost, :description, :address, :phone_number, :nearest_station, :travel_time, :business_hours, :official_url, {images: []}).merge(user_id: current_user.id)
  end

  def location_params_up 
    params.require(:location).permit(:meal_enter_id, :requires_id, :title, :estimated_time, :max_cost, :min_cost, :description, :address, :phone_number, :nearest_station, :travel_time, :business_hours, :official_url, {images: []})
  end

  def random_items_by_meal_enter(search, key, key_b)
  meal_enter_1_items = Location.where('address LIKE ?', "%#{search}%").where(meal_enter_id: 2).order('RAND()').limit(key)
  meal_enter_2_items = Location.where('address LIKE ?', "%#{search}%").where(meal_enter_id: 3).order('RAND()').limit(key_b)

  meal_enter_1_items.to_a + meal_enter_2_items.to_a
 end

 end
