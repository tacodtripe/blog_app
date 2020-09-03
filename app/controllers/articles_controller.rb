# frozen_string_literal: true

class ArticlesController < ApplicationController
  include ArticlesHelper
  def index
    @articles = Article.all
  end

  def show
    @article = Article.find(params[:id])
    @comment = Comment.new
    @comment.article_id = @article.id
  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(article_params)
    @article.save
    redirect_to article_path(@article)
    flash.notice = "Article '#{@article.title}' was created succesfully!"
  end

  def destroy
    @article = Article.find(params[:id])
    @article.destroy
    redirect_to article_path(@article)
    flash.notice = "Article '#{@article.title}' was deleted succesfully!"
  end

  def edit
    @article = Article.find(params[:id])
  end

  def update
    @article = Article.find(params[:id])
    @article.update(article_params)
    flash.notice = "Article '#{@article.title}' Updated!"
    redirect_to article_path(@article)
  end
end
