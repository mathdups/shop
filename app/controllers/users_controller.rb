class UsersController < ApplicationController
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
    params.require(:user).permit(:email, :password, :photo)
  end
end
