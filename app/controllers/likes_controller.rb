class LikesController < ApplicationController
    def new
        @like = Like.new
    end

    def create
        @like = Like.new(likes_params)
        @user = current_user
        @like.author_id = current_user.id
        @like.post_id = params[:post_id]

        if @like.save
            redirect_to user_post_url(current_user.id, post.id)
        else
            render 'new'
        end
    end

    private
    def likes_params
        params.require(:like).permit(:post_id)
    end
end