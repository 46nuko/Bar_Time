class CommentsController < ApplicationController

  def new

  end

  def index
    @comments = Comment.all
  end

  def show
  end
end
