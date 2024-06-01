class BarsController < ApplicationController

  def index
    @bars = Bar.all.page(params[:page])
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
    @comments = @bar.comments
  end

  def admin_index
    @bar = Bar.new
    @bars = Bar.all
  end

  def admin_create
    @bar = Bar.new(bar_params)
    @bar.save!
    bar_tag = BarTag.new(bar_id: @bar.id, tag_id: params[:bar][:tag_id])
    bar_tag.save!
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
