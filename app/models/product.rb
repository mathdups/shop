class Product < ApplicationRecord
  mount_uploader :photo, PhotoUploader
  validates :short_description, length: {maximum: 150}, on: :create
  belongs_to :category
  
  has_many :product_categories
  validates :title, uniqueness: true, presence: true
  validates :price, presence: true
  validates :short_description, presence: true
  validates :description, presence: true
  translates :description, :short_description, :title
  

  has_many :variants, class_name: 'ProductVariant'


end
