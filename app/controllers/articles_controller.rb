class ArticlesController < ApplicationController
  def index
    @articles = Article.all
  end

  def new
    @article = Article.new
  end

  def edit
    @article = Article.find(params[:id])
  end

  def create
    @article = Article.new(article_params)
    if @article.save
      flash[:notice] = "Article was successfully created"
      redirect_to article_path(@article)
    else
      render 'new'
    end
  end

  def update
    @article = Article.find(params[:id])
    if @article.update(article_params) #to call a specifical record from "article table"
      flash[:notice] = "Article successfully updated"
      redirect_to article_path(@article)
    else
      render 'edit'
    end
  end

  def show
    @article = Article.find(params[:id])
  end

  def destroy
    @article = Article.destory(params[:id])
    flash[:notice] = "Article successfully deleted"
    redirect_to articles_path
  end

  private
  def article_params
    params.require(:article).permit(:title, :description) #to call "article table" with require method and to permit calling columns with permit"
  end

end
