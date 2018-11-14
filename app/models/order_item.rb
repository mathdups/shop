class OrderItem < ApplicationRecord
  mount_uploader :photo, PhotoUploader
  belongs_to :order
  belongs_to :product
  
 
  
end
