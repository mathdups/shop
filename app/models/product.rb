class Product < ApplicationRecord
  mount_uploader :photo, PhotoUploader
  has_one :category
  has_one :category_product, through: :category

  has_many :variants, class_name: 'ProductVariant'
  
end
