class Product < ApplicationRecord
  mount_uploader :photo, PhotoUploader
  has_one :product_categories
  has_one :categories, through: :product_categories

  has_many :variants, class_name: 'ProductVariant'
  accepts_nested_attributes_for :categories, reject_if: :all_blank, allow_destroy: true
end
