class Product < ApplicationRecord
  mount_uploader :photo, PhotoUploader

  has_one :category, through: :product_category

  has_many :variants, class_name: 'ProductVariant'
  
end
