class TagsController < ApplicationController
  def show
    @tag = Tag.find(params[:id])
  end

  def index
    @tags = Tag.all
  end

  def edit
    @tags = Tag.find(params[:id])
  end

  def destroy
    @tags = Tag.find(params[:id])
    @tags.destroy
    redirect_to article_path(@article)
    flash.notice = "Tag '#{@tags.name}' was deleted succesfully!"
  end
end
