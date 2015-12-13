class FavoriteshipsController < ApplicationController
  before_action :logged_in_user
  
  def create
    @comment = Comment.find(favcom_params[:comment_id])
    current_user.favorite_com(@comment)
  end
  
  def destroy
    @comment = current_user.favcom_relationships.find(params[:id]).comment
    current_user.unfavorite_com(@comment)
    #@comment = Comment.find(params[:id]) # by kano
    #current_user.unfavorite_com(@comment)
  end
  
  def favcom_params
      params.fetch(:favoriteship, {}).permit(:user_id, :comment_id)
  end

end
