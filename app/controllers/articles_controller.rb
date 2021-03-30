class ArticlesController < ApplicationController
  before_action :authenticate_admin!, only: [:edit, :new, :create, :update, :destroy]

  def index
    @search = params[:search]

    @articles = Article.all
    @articles = @articles.search(@search) if @search.present?
    @articles = @articles.page(params[:page]).per(5)

    respond_to do |format|
      format.html
      format.csv { send_data generate_csv(Article.all), file_name: 'articles.csv'}
    end
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

    redirect_to action: :index
  end

  def update
    @article = Article.find(params[:id])
    @article.update(article_params)
    redirect_to action: :index
  end

  def destroy
    @article = Article.find(params[:id])
    @article.destroy
    redirect_to action: :index
  end

  def csv_upload
    data = params[:csv_file].read.split("\n")
    data.each do |line|
      attr = line.split(",").map(&:strip)
      Article.create title: attr[0], body: attr[1]
    end
    redirect_to action: :index
  end

  def generate_csv(articles)
    articles.map{ |a| [a.title, a.body, a.created_at.to_date].join(',')}.join("\n")
  end

  private

  def article_params
    params.require(:article).permit(:title, :body, :stock, :price, :status => []).tap do |w|
      w[:status] = w[:status][1].to_i
    end
  end
end