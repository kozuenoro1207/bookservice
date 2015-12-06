class WelcomeController < ApplicationController
  def index
    if logged_in?
      @talkrooms = current_user.talkrooms.build
      @feed_items = current_user.feed_items.includes(:user).order(created_at: :desc)
    end
    
  end
end
