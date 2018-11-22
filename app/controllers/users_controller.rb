class UsersController < ApplicationController
  before_action :authenticate_user!
  def index
    @users = User.all
    @orders = Order.all
    @items = OrderItem.all
  end

  def show
   
  end

  def new
    
  end

  def create

  end

  def edit
    @user = User.find(params[:id])
  end
  
  def update
    current_user.update(user_params)
  end

  private

  def destroy
    @user.destroy
    redirect_to root_path
  end


  def set_user
    @user = User.find(params[:id])
  end
  def user_params
    params.require(:user).permit(:photo, :first_name, :last_name, :address, :postal_code, :city, :country)
  end
end
