class LikesController < ApplicationController
    def new
        @like = Like.new
    end

    def create
        @like = Like.new(likes_params)
        @user = current_user
        @like.author = @user

        if @like.save
            redirect_to user_post_path(id: params.require(:post_id), author_id: params.require(:user_id))
        else
            render 'new'
        end
    end

    private
    def likes_params
        params.require(:like).permit(:post_id)
    end
end