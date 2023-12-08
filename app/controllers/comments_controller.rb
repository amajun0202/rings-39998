class CommentsController < ApplicationController


  def create
    @comment = Comment.new(comment_params)
  
    @comment.save
    redirect_to location_path(@comment.location_id)
    end

  private
  def comment_params
    params.require(:comment).permit(:text, :location_id).merge(user_id: current_user.id)
  end
end
