class CommentsController < ApplicationController
  def new
    @post = @current_user.posts.find(params[:post_id])
  end

  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.new(comment_params)
    @comment.author = @current_user
    if @comment.save
      @user = User.find(params[:user_id])
      redirect_to user_post_path(@user, @post)
    else
      render :new
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:text)
  end
end
