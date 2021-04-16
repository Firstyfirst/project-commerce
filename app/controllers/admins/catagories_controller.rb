class Admins::CatagoriesController < ApplicationController
  before_action :authenticate_admin!, only: [:edit, :new, :create, :update, :destroy]
  def index
    @search = params[:search]

    @catagories = Catagory.all
    @catagories = @catagories
      .where("title LIKE ? or body LIKE ?", "%#{@search}%", "%#{@search}%") if @search.present?
    @catagories = @catagories.page(params[:page]).per(5)
  end

  def show
    @catagory = Catagory.find(params[:id])
  end

  def new
    puts "This is how you print out something."
    @catagory = Catagory.new
  end

  def edit
    @catagory = Catagory.find(params[:id])
  end

  def create
    @catagory = Catagory.create(catagory_params)

    if @catagory.invalid?
      flash[:error] = @catagory.errors.full_messages
    end

    redirect_to action: :index
  end

  def update
    @catagory = Catagory.find(params[:id])
    @catagory.update(catagory_params)
    redirect_to action: :index
  end

  def destroy
    @catagory = Catagory.find(params[:id])
    @catagory.destroy
    redirect_to action: :index
  end

  private

  def catagory_params
    params.require(:catagory).permit(:title, :body)
  end
end
