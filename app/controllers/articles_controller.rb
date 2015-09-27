class ArticlesController < ApplicationController
  before_action :get_article, only: [:show, :edit, :update, :destroy]
  before_action :check_auth, only: [:new, :create, :edit, :update, :destroy]

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(article_params)
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
    params.require(:article).permit(:name, :description, :image)
  end
  def check_auth
    if !current_user || current_user.id != @article.user_id
      redirect_to root_path
    end
  end
  def get_article
    @article = Article.find(params[:id])
  end
end
