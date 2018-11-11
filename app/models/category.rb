class Category < ApplicationRecord
  has_many :product_categories
  has_many :products

  validates :title, uniqueness: true
end
