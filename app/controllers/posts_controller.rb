class PostsController < ApplicationController
  def index
    @posts = Post.all.order(created_at(DESC))
  end

  def show
    @post = Post.find(params[:id])
  end
end
