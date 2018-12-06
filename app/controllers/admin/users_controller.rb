class Admin::UsersController < ApplicationController
  before_action :authorized?

  def index 
    @users = User.all.order("email ASC")
  end

  def edit 
    @user = User.find(params[:id])
  end

  def update 
    @user = User.find(params[:id])
    if @user.update_attributes(user_params)
      @user.save
      redirect_to admin_users_path, notice: "Utilisateur mis à jour"
    else
      redirect_to root_path
    end
  end
  
  def destroy
    @user = User.find(params[:id])
    @user.destroy
    flash[:notice] = "Utilisateur correctement supprimé"
    redirect_to admin_users_path
  end

  def purchases
   @user = User.find(params[:id])
   @purchases = @user.purchases.order("created_at ASC")
   @orders = Order.where(status: "open")
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