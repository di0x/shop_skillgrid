class ArticlesController < ApplicationController
  before_action :get_article, only: [:show, :edit, :update, :destroy]
  authorize_resource

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(article_params)
    @article.user_id = current_user.id
    @article.pro ||= false
    @article.shop_name = current_user.shop_name
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
  end

  def edit
    render "new"
  end

  def update
    if @article.update(article_params)
      redirect_to articles_path
    else
      render "new"
    end
  end

  def destroy
    if @article.destroy
      redirect_to articles_path
    else
      redirect_to article_path(@article)
    end
  end

  private
  def article_params
    if current_user.has_role?("admin")
      params.require(:article).permit(:name, :description, :image, :pro) 
    else
      params.require(:article).permit(:name, :description, :image) 
    end
  end
  def get_article
    @article = Article.find(params[:id])
  end
end
