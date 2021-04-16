class Article < ApplicationRecord
  enum status: {draft: 0, published: 1, archived: 2}

  scope :search, -> (arg) {where("title LIKE ? or body LIKE ?", "%#{arg}%", "%#{arg}%")}

  has_many :comments
  has_many :product_catagory
  has_many :catagory, through: :product_catagory

  has_one_attached :single_image
  has_many_attached :multi_image

  validates :body, length: { minimum: 4 }
  validate :no_bad_words_in_title

  validates_numericality_of :stock, :price, :only_integer => true, :greater_than_or_equal_to => 0

  def no_bad_words_in_title
    if title.downcase.include?('bad')
      errors.add(:title, 'cannot contain bad words')
    end
  end

end