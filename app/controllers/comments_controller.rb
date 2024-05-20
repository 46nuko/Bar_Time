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
  end

  private

  def comment_params
    params.require(:comment).permit(:title,:content,:star)
  end
end
