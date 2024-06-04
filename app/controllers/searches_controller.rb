class SearchesController < ApplicationController
  #before_action :authenticate_user!
  def search
    @range = params[:range]
    @word = params[:word]
    if @range == "User"
      @comments = Comment.looks(params[:search], params[:word])
    elsif @range == "Tag"
      @tags = Tag.looks(params[:search], params[:word])
    else
      @bars = Bar.looks(params[:search], params[:word])
    end
  end
end
