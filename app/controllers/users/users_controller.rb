class Users::UsersController < ApplicationController

  def mypage
  end

  def show
    @user = User.find(params[:id])
  end
end
