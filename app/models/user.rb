class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  mount_uploader :photo, PhotoUploader
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
 

  has_many :items, class_name: 'OrderItem'
  has_many :orders
  has_many :purchases

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:username, :email, :password,
      :password_confirmation, :remember_me, :photo, :photo_cache, :remove_photo) }
    devise_parameter_sanitizer.permit(:account_update) { |u| u.permit(:username, :email, :password,
      :password_confirmation, :current_password, :photo, :photo_cache, :remove_photo) }
  end

  def rememberable_value
    self.remember_token ||= Devise.friendly_token
  end
  
  
  def remember_me
    true
  end
end
