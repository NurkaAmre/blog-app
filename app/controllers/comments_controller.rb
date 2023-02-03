class CommentsController < ApplicationController
    def new
        @comment = Comment.new
    end

    def create
        @comment = Comment.new(comments_params)
        @comment.author_id = current_user.id
        @comment.post_id = params[:post_id]
        post = Post.find(params[:post_id])
        if @comment.save
          redirect_to user_post_path(current_user.id, post)
        else
          render :new
        end
      end

    private
    def comments_params
        params.require(:comment).permit(:text, :post_id)
    end
end