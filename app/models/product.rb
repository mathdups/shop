class Product < ApplicationRecord
  mount_uploader :photo, PhotoUploader
  belongs_to :category

  has_many :product_categories
  

  has_many :variants, class_name: 'ProductVariant'


end
