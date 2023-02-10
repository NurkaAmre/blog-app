class Api::V1::PostsController < Api::V1::ApplicationController
  def index
    @posts = Post.where(author_id: params[:user_id])
    render json: @posts
  end
end
