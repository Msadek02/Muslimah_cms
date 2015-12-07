class ArticlesController < ApplicationController
  def index
    if params[:search]
      @articles = Article.search(params[:search]).order("created_at DESC")
    else
      @articles = Article.order("created_at DESC")
    end
  end
end