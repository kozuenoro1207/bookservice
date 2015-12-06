class TalkroomsController < ApplicationController
    def new
        @talkroom = Talkroom.new(user_id: current_user.id)
    end
  
    def create
        @talkroom = Talkroom.new(talkroom_params)
        if @talkroom.save
            redirect_to @talkroom
        else
            render 'users/show'
        end
    end

    def show
        @talkroom = Talkroom.find(params[:id])
        @comment = current_user.comments.build if logged_in?
        #@comments = @talkroom.comments.order(created_at: :desc)
    end
    
    private
    def talkroom_params
        params.require(:talkroom).permit(:user_id, :talkname)
    end
end
