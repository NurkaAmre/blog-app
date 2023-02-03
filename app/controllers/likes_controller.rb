class LikesController < ApplicationController
  def new
    @like = Like.new
  end

  def create
    @like = Like.new(author_id: current_user.id, post_id: params[:post_id])
    @user = current_user
    @post = Post.find(params[:post_id])

    if @like.save
      redirect_to user_post_path(@user, @post)
    else
      render :new
    end
  end
end
