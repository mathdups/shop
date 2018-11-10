class ProductCategory < ApplicationRecord
  belongs_to :category
  has_one :product_category

  has_many :products, :through => :product_categories
end
