class RegistrationsController < Devise::RegistrationsController

  private

  def sign_up_params
    params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation, :address, :postal_code, :city, :country, :photo, :photo_cache)
  end

  def account_update_params
    params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation, :current_password, :address, :postal_code, :city, :country, :photo, :photo_cache)
  end
end