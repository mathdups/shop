class UsersController < ApplicationController
  before_action :authenticate_user!

  def edit
    @user = User.find(params[:id])
  end
  
  def update
    current_user.update(user_params)
    if current_user.save
      flash[:success] = "Merci pour ce bel update!"
      redirect_to '/cart/checkout'
    else
      render 'new'
    end
  end


  

  def destroy
    @user.destroy
    redirect_to root_path
  end

  private
  def set_user
    @user = User.find(params[:id])
  end
  def user_params
    params.require(:user).permit(:username, :email, :password,
      :password_confirmation, :remember_me, :photo, :photo_cache, :remove_photo, :first_name, :last_name, :phone, :address, :city, :country, :postal_code)
  end
end
