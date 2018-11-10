class OrdersController < ApplicationController
  protect_from_forgery
  before_action :authenticate_user!, only: [:new, :create]
  
  def def new
    @order = current_cart.order
    if (order_params.merge(status: 'open'))
      session[cart_token] = nil
      redirect_to order_items_path
    else
      redirect_to root_path
    end
  end

  def create
    @order = current_cart.order
    if @order.update_attributes(order_params.merge(status: 'open'))
      redirect_to order_items_path
    else 
      redirect_to root_path
    end
  end

  private

  def order_params
    params.require(:order).permit(:first_name, :last_name, :quantity, :public_id)
  end
  
end