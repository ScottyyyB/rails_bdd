class ArticlesController < ApplicationController

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(article_params)
    @comment = Comment.new(article: @article)
    @article.save ? article_created : (render :new)

  end

  def show
    @article = Article.find(params[:id])
  end

  private

  def article_params
    params[:article].permit(:title, :content)
  end

  def article_created
    flash[:notice] = "Article was successfully created."
    redirect_to root_path
  end
end
