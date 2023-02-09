class PostsController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    # @posts = Post.where(author_id: @user)
    @posts = @user.posts.includes(:comments, :likes)
  end

  def show
    @user = User.find(params[:user_id])
    @post = Post.find(params[:id])
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.author_id = current_user.id
    if @post.save
      redirect_to user_posts_path(current_user)
    else
      render :new
    end
  end

  def destroy
    Post.delete(params[:id])
    redirect_to user_posts_path(params[:user_id])
  end
  
  private

  def post_params
    params.require(:post).permit(:title, :text)
  end
end
