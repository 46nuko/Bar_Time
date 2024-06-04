class CommentsController < ApplicationController

  def new
    @comment = Comment.new
  end

  def create
    @comment = Comment.new(comment_params)
    @comment.user_id = current_user.id
    @comment.bar_id = params[:comment][:bar_id]
    @comment.save!
    redirect_to bars_path
  end

  def index
    @comments = Comment.all
  end

  def show
    @comment = Comment.find(params[:id])
    @user = @comment.user
  end

  def destroy
    comment = Comment.find(params[:id])
    comment.destroy
    redirect_to bars_path
  end

  def edit
    @comment = Comment.find(params[:id])
  end

  def update
    @comment = Comment.find(params[:id])
    @comment.update(comment_params)
    redirect_to comment_path
  end


  private

  def comment_params
    params.require(:comment).permit(:title,:content,:star)
  end
end
