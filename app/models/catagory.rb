class Catagory < ApplicationRecord
    has_many :product_catagory
    has_many :article, through: :product_catagory
end
