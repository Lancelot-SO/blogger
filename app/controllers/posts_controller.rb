class PostsController < ApplicationController
  def index
    @users = User.find(params[:id])
    @posts = @users.posts
  end

  def show
    @post = Post.find(params[:id])
  end
end
