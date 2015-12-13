class UsersController < ApplicationController
  def new
    @user = User.new
  end
  
  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to @user, notice:"会員登録が成功しました"
    else
      render 'new'
    end
  end
  def show
    @user = User.find(params[:id])
    @talkrooms = @user.talkrooms.order(created_at: :desc)
  end
  
  def followings
    @user = User.find(params[:id])
    @followings = @user.following_users
  end
  
  def followers
    @user = User.find(params[:id])
    @followers = @user.follower_users
  end
  
  def favcoms
      @user = User.find(params[:id])
      @talkroom_comments = @user.fav_comments.order(created_at: :desc)
  end
  
  def favtalks
      @user = User.find(params[:id])
      @talkrooms = @user.fav_talkrooms.order(created_at: :desc)
  end
  
  private
  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end
