class UsersController < ApplicationController
  before_action :authenticate_user!

  def edit
    @user = User.find(params[:id])
  end
  

  def update
    @user = User.find(params[:id])
    respond_to do |format|
      if @user.update_attributes(user_params)
        format.html { redirect_to billing_path, notice: 'Votre compte a bien été mis à jour' }
      else
        format.html { redirect_to root_path, alert: 'Erreur lors de la mise à jour de votre compte' }
      end
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
    params.require(:user).permit(:first_name, :last_name, :address, :postal_code, :city, :country)
  end
end
