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

  end

  def update

  end

  private

  def tag_params
    params.require(:tag).permit(:name)
  end

end
