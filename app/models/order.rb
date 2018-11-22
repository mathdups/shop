class Order < ApplicationRecord
  has_many :items, class_name: 'OrderItem'
  has_and_belongs_to_many :users
  
  
 

 


 end


