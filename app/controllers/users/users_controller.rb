class Users::UsersController < ApplicationController

  def mypage
    @user = current_user
    @comments = @user.comments
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    redirect_to users_mypage_path
  end

  def check
    @user = User.find(params[:id])
  end

  def withdraw
    @user = User.find(params[:id])
    @user.update(is_deleted: true)
    reset_session
    flash[:notice] = "退会処理を実行いたしました"
    redirect_to root_path
  end

  def show
    @user = User.find(params[:id])
    @comments = @user.comments
  end

private

  def user_params
    params.require(:user).permit(:name)
  end
end
