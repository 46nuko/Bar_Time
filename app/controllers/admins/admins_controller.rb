class Admins::AdminsController < ApplicationController

  def index
    @users = User.all
  end

  def show

  end

  def edit

  end
end