class CommentsController < ApplicationController
  load_and_authorize_resource
  def new
    @user = User.find(params[:user_id])
    @post = @user.posts.find(params[:post_id])
  end

  def index
    @user = User.find(params[:user_id])
    @post = Post.find(params[:post_id])
    @comments = @post.comments
    respond_to do |format|
      format.json { render json: @comments }
      format.json { render json: @posts }
    end
  end

  def create
    @user = User.find(params[:user_id])
    @post = Post.find(params[:post_id])
    @comment = @post.comments.new(comment_params)
    @comment.author = @user
    respond_to do |format|
      if @comment.save
        format.html { redirect_to request.referrer, notice: 'comment was successfully created.' }
        format.json { render Json: @comment, status: :created }
      else
        format.html { render :new }
        format.json do
          render json: @comment, status: :created
        end
      end
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
    redirect_to request.referrer
  end

  private

  def comment_params
    params.require(:comment).permit(:text)
  end
end
