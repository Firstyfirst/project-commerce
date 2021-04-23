class Api::V1::CommentsController < ApplicationController
    def index
      @comments = Article.find(params[:article_id]).comments
      # Not optimal, but get the job done
      render json: @comments
    end
  end
  