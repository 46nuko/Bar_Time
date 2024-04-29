class Users::UsersController < ApplicationController

  def mypage
    @user = current_user
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    redirect_to mypage_path
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
