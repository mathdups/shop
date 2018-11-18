class Product < ApplicationRecord
  mount_uploader :photo, PhotoUploader
  validates :short_description, length: {maximum: 150}, on: :create
  belongs_to :category

  has_many :product_categories
  

  has_many :variants, class_name: 'ProductVariant'


end
