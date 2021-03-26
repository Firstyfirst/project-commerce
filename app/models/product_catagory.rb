class ProductCatagory < ApplicationRecord
    belongs_to :catagory
    belongs_to :article 
end