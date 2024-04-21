class CommentsController < ApplicationController

  def new
    @comment = Comment.new
  end

  def create
    @comment = Comment.new(comment_params)
    @comment.user_id = current_user.id
    @comment.save
    redirect_to bars_path
  end

  def index
    @comments = Comment.all
  end

  def show
  end

  private

  def comment_params
    params.require(:comment).permit(:title,:content)
  end
end
