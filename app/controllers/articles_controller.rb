class ArticlesController < ApplicationController
  def new
    @article = Article.new
    unless current_user
      redirect_to root_path
    end
       
  end

  def create
    @article = Article.new(article_params)
    @article.user_id = current_user.id
    if @article.save
      redirect_to articles_path, :notice => "Пост создан!"
    else
      render "new"
    end
  end

  def index
    @articles = Article.all
  end

  def show
    @article = Article.find(params[:id])
  end

  def edit
    @article = Article.find(params[:id])
    if current_user && @article.user_id == current_user.id
      render "new"
    else
      redirect_to root_path
    end
  end

  def update
    @article = Article.find(params[:id])
    if @article.update(article_params)
      #raise params.inspect
      redirect_to articles_path
    else
      render "new"
    end
  end

  def destroy
    @article = Article.find(params[:id])
    if @article.destroy
      redirect_to articles_path
    else
      redirect_to article_path(@article)
    end
  end

  private
  def article_params
    params.require(:article).permit(:name, :description, :image)
  end
end
