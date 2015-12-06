class CommentsController < ApplicationController
    before_action :logged_in_user, only: [:create]
    
    def create
        @comment = current_user.comments.build(comment_params)
        
        if @comment.save
            flash[:success] = "コメントが投稿されました"
            redirect_to talkroom_path(@comment.talkroom_id)
        else
            redirect_to root_path
        end
    end
    
    private
    def comment_params
        params.require(:comment).permit(:content, :talkroom_id)
    end
    
end
