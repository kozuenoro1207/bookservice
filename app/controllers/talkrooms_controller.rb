class TalkroomsController < ApplicationController
    def new
        @talkroom = Talkroom.new
    end
  
    def create
        @talkroom = Talkroom.new(talkroom_params)
        if @talkroom.save
            redirect_to @talkroom
        else
            render 'new'
        end
    end

  
    def show
        @talkroom = Talkroom.find(params[:id])
        #@comment = current_user.comments.build if logged_in?
    end
  
    private
    def talkroom_params
        params.require(:talkroom).permit(:talkname)
    end
end
