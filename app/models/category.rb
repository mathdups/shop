class Category < ApplicationRecord
  has_many :product_categories
  has_many :products, :dependent => :delete_all

  validates :title, uniqueness: true, presence: true
  translates :title
end
