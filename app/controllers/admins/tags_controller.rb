class Admins::TagsController < ApplicationController

  def index
    @tag = Tag.new
    @tags = Tag.all
  end

  def create
    @tag = Tag.new(tag_params)
    @tag.save
    redirect_to admins_tags_path
  end

  def show

  end

  def edit
    @tag = Tag.find(params[:id])
  end

  def update
    @tag = Tag.find(params[:id])
    @tag.update(tag_params)
    redirect_to admins_tags_path
  end

  def destroy
    tag = Tag.find(params[:id])
    tag.destroy
    redirect_to admins_tags_path
  end

  private

  def tag_params
    params.require(:tag).permit(:name)
  end

end
