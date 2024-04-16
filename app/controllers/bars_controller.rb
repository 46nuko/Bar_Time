class BarsController < ApplicationController

  def new

  end

  def index
    @bar = Bar.find(params[:id])
    @comments = @bar.comments
  end

  def show

  end
end
