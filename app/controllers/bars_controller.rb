class BarsController < ApplicationController

  def new
    @bar = Bar.new
  end

  def create
    @bar = Bar.new(bar_params)
    @bar.user_id = current_user.id
    @bar.save
    redirect_to bars_path
  end

  def index
    @bars = Bar.all
    if params[:word].present?
      bar_results = Bar.where("name LIKE ?", "%#{params[:search]}%")
      comment_results = Comment.where("content LIKE ?", "%#{params[:search]}%")
      @results = bar_results + comment_results
    else
      @results = []
    end
  end

  def show
    @bar = Bar.find(params[:id])
  end

  private

  def bar_params
    params.require(:bar).permit(:name,:address)
  end
end
