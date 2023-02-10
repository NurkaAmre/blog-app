class Api::V1::CommentsController < Api::V1::ApplicationController
  def index
    @post = Post.find(params[:post_id])

    render json: @post.comments
  end

  def create
    current_user = params[:user_id]
    @comment = Comment.new(comment_params)
    @comment.author_id = current_user
    @comment.post_id = params[:post_id]
    @post = Post.find(params[:post_id])
    @comment.save!
    render json: @comment, status: :created
  end

  private

  def comment_params
    params.require(:comment).permit(:text)
  end
end
