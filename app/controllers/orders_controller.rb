class OrdersController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]
 
  include OrdersHelper  
  helper_method :resource_name, :resource, :devise_mapping, :resource_class
  
  # def update
  #   @order = Order.new
  #   @order.id = params[:order_id]
  #   @order = current_cart.order
  #   if (order_params.merge(status: 'open'))
  #     session[cart_token] = nil
  #     redirect_to order_items_path
  #   else
  #     redirect_to root_path
  #   end
  # end
  

  def new
    @order = Order.new
  end
  
  

  def conditions
    current_user_id != nil
  end
    

  def create
    @order = current_cart.order
      if @order.update_attributes(order_params.merge(status: 'open'))
        redirect_to root_path
      else 
        redirect_to checkout_path
      end
  end

  def update
    @order = current_cart.order
    if @order.update_attributes(order_params)
      redirect_to checkout_path, notice: "Profile updated"
    else
      redirect_to checkout_path
    end
  end

  def edit
    @order = @order.find(params[:id])
    
  end


  

   
  

  private

  def order_params
    params.require(:order).permit(:first_name, :last_name, :address, :postal_code, :city, :user_id)
  end
end