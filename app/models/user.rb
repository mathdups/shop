class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  mount_uploader :photo, PhotoUploader
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable

 

  has_many :items, class_name: 'OrderItem'
  has_many :orders
  has_many :purchases

  

  def rememberable_value
    self.remember_token ||= Devise.friendly_token
  end
  
  
  def remember_me
    true
  end
end
