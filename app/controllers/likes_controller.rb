class LikesController < ApplicationController
  def new
    @user = User.find(params[:user_id])
  end

  def create
    @user = User.find(params[:user_id])
    @post = Post.find(params[:post_id])
    @like = @post.likes.new
    @like.author = @user
    if @like.save
      redirect_to user_post_path(@user, @post)
    else
      render :new
    end
  end
end
