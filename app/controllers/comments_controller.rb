class CommentsController < ApplicationController
    def new
        @comment = Comment.new
    end

    def create
        @comment = Comment.new(comments_params)
        @current_user = current_user
        @comment.author = @current_user

        if @comment.save
            redirect_to user_post_path(id: params.require(:post_id), author_id: params.require(:user_id))
        else
            render 'new'
        end
    end

    private
    def comments_params
        params.require(:comment).permit(:text, :title, :post_id)
    end
end