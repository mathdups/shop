class OrderItemsController < ApplicationController

  def index
    @items = current_cart.order.items
  end

  def create
    
    current_cart.add_item(
      product_id: params[:product_id],
      quantity: params[:quantity]
    )
     

    redirect_to order_items_path
    
  end

  
    #Ex:- :null => false
  
  def destroy
    current_cart.remove_item(id: params[:id])
    redirect_to order_items_path
  end

end
