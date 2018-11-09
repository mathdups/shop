class Category < ApplicationRecord

  has_many :product_categories
  has_many :products, through: :product_categories

  accepts_nested_attributes_for :products, reject_if: :all_blank, allow_destroy: true

end
