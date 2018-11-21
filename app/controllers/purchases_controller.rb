class PurchasesController < ApplicationController
  def show
    @purchase = Purchase.find(params[:id])
    @order = Order.last(2).first
  end





private

 
end