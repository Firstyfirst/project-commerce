class ProductCatagoriesController < ApplicationController
    def create
        @catagory = Catagory.find params[:catagory_id]
        product = Article.find_by(body: product_catagory_params[:result])
        @catagory.product_catagory.create(article: product)
        redirect_to catagories_path
    end

    private
    def product_catagory_params
        params.require(:product_catagory).permit(:result)
    end
end
