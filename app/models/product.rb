class Product < ApplicationRecord
  mount_uploader :photo, PhotoUploader
  
 
  

  has_many :variants, class_name: 'ProductVariant'

  has_many :orders, through: :order_items, foreign_key: 'product_id'
 

  
  
end
