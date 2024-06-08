class CommentsController < ApplicationController

  def new
    @comment = Comment.new
  end

  def create
    @comment = Comment.new(comment_params)
    @comment.user_id = current_user.id
    @comment.bar_id = params[:comment][:bar_id]
    #byebug
    if @comment.save
      redirect_to bars_path, notice: "コメントが投稿されました"
    else
      flash.now[:alert] = "コメントの投稿に失敗しました"
      render :new
    end
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

def admin_index
  @comments = Comment.all
  @users = User.all
end

def admin_destroy
  comment = Comment.find(params[:id])
  comment.destroy
  redirect_to admin_index_comments_path
end

  private

  def comment_params
    params.require(:comment).permit(:bar_id, :tag_id, :title, :content, :star)
  end
end
