class LikesController < ApplicationController

    def create
      like = current_user.likes.build(location_id: params[:id])
  
      if like.save
        redirect_to location_path(params[:id])
      else
        puts like.errors.full_messages
        head :no_content
      end
    end

    def destroy
      like = Like.find_by(location_id: params[:id], user_id: current_user.id)
      like.destroy
      redirect_to location_path(params[:id])
    end

    def show
      @user = User.find(params[:user_id])
      @liked_locations = @user.liked_locations
    end

end
