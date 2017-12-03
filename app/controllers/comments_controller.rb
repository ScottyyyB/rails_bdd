class CommentsController < ApplicationController
  def new
    @article = Article.find(params[:article_id])
    @comment = Comment.new(article: @article)
  end

  def create
    @article = Article.find(params[:article_id])
    @comment = Comment.new(article: @article,
      body: params[:comment][:body],
      email: params[:comment][:email])
    @comment.save ? comment_created : (render :new)
  end

  private
  
  def comment_created
    flash[:notice] = "Comment has been successfully created."
    redirect_to root_path
  end
end
