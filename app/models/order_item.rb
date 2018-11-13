class OrderItem < ApplicationRecord
  mount_uploader :photo, PhotoUploader
  has_one :order
  belongs_to :product
  
 
  
end
