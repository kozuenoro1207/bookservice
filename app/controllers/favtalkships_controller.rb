class FavtalkshipsController < ApplicationController
  before_action :logged_in_user
  
  def create
    @talkroom = Talkroom.find(favtalk_params[:talkroom_id])
    current_user.favorite_talk(@talkroom)
  end
  
  def destroy
    @talkroom = current_user.favtalk_relationships.find(params[:id]).talkroom
    current_user.unfavorite_talk(@talkroom)
  end
  
  def favtalk_params
      params.fetch(:favtalkship, {}).permit(:user_id, :talkroom_id)
  end

end
