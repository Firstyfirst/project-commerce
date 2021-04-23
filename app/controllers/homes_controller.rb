class HomesController < ApplicationController
    def index
      @articles = Article.all.page(params[:page]).per(15)
    end
  end
  