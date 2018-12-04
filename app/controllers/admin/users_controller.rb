class Admin::UsersController < ApplicationController
  before_action :authorized?

  def index 
    @users = User.all
    @orders = Order.where(status: "open")
    @items = OrderItem.all
    @purchases = Purchase.all
    
  end
  

  private

  def user_params
    params.require(:user).permit(:username, :email, :password,
      :password_confirmation, :remember_me, :photo, :photo_cache, :remove_photo, :first_name, :last_name, :phone, :address, :city, :country, :postal_code)
  end

  def authorized?
    unless current_user.admin?
      flash[:alert] = "Vous n'êtes pas autorisé à voir cette page."
      redirect_to root_path
    end
  end
  
end