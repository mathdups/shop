class Product < ApplicationRecord
  mount_uploader :photo, PhotoUploader
  has_one :product_categories
  has_one :categories, through: :product_categories

  has_many :variants, class_name: 'ProductVariant'

end
