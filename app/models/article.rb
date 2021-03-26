class Article < ApplicationRecord

    has_many :comments
  
    validates :body, length: { minimum: 4 }
    validate :no_bad_words_in_title

    validates_numericality_of :stock, :price, :only_integer => true, :greater_than_or_equal_to => 0

    has_many :product_catagory
    has_many :catagory, through: :product_catagory
  
    def no_bad_words_in_title
      if title.downcase.include?('bad')
        errors.add(:title, 'cannot contain bad words')
      end
    end
  end