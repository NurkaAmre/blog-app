class Api::V1::CommentsController < Api::V1::ApplicationController
  def index
    @post = Post.find(params[:post_id])

    render json: @post.comments
  end

  def create
    @comment = Comment.new(comment_params)

    if @comment.save
      render json: @comment, status: :created
    else
      render json: @comment.errors, status: :unprocessable_entity
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:author_id, :post_id, :text)
  end
end
