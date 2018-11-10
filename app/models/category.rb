class Category < ApplicationRecord
  attr_accessor :category
  has_many :product_categories
  has_many :products, through: :product_categories, dependent: :delete_all, foreign_key: 'product_id'

  accepts_nested_attributes_for :products, reject_if: :all_blank, allow_destroy: true
 
  
end
