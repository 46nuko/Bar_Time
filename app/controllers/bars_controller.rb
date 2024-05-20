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
      tag_results = Tag.where("name LIKE ?", "%#{params[:search]}%")
      @results = bar_results + comment_results + tag_results
    else
      @results = []
    end
  end

  def show
    @bar = Bar.find(params[:id])
  end

  def admin_index
    @bar = Bar.new
    @bars = Bar.all
  end

  def admin_create
    @bar = Bar.new(bar_params)
    @bar.save
    redirect_to admin_index_bars_path
  end

  def admin_destroy
    bar = Bar.find(params[:id])
    bar.destroy
    redirect_to admin_index_bars_path
  end

  def admin_edit
    @bar = Bar.find(params[:id])
  end

  def admin_update
    @bar = Bar.find(params[:id])
    @bar.update(bar_params)
    redirect_to admin_index_bars_path
  end

  private

  def bar_params
    params.require(:bar).permit(:name,:address)
  end
end
