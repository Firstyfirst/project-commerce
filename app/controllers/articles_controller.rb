class ArticlesController < ApplicationController
  before_action :authenticate_admin!, only: [:admin_index, :edit, :new, :create, :update, :destroy]

  def admin_index
    @search = params[:search]

    @articles = Article.all
    @articles = @articles
      .where("title LIKE ? or body LIKE ?", "%#{@search}%", "%#{@search}%") if @search.present?
    @articles = @articles.page(params[:page]).per(5)
  end

  def user_index
    @search = params[:search]

    @articles = Article.all
    @articles = @articles
      .where("title LIKE ? or body LIKE ?", "%#{@search}%", "%#{@search}%") if @search.present?
    @articles = @articles.page(params[:page]).per(5)
  end
  
  def show
    @article = Article.find(params[:id])
  end

  def new
    puts "This is how you print out something."
    @article = Article.new
  end

  def edit
    @article = Article.find(params[:id])
  end

  def create
    @article = Article.create(article_params)

    if @article.invalid?
      flash[:error] = @article.errors.full_messages
    end

    redirect_to action: :admin_index
  end

  def update
    @article = Article.find(params[:id])
    @article.update(article_params)
    redirect_to action: :admin_index
  end

  def destroy
    @article = Article.find(params[:id])
    @article.destroy
    redirect_to action: :admin_index
  end

  private

  def article_params
    params.require(:article).permit(:title, :body, :stock, :price)
  end
end