class PurchasesController < ApplicationController
  def show
    @purchase = Purchase.find_by_uuid(params[:id])
    @order = Order.where(user_id: current_user.id).last(2).first
  end







  private

 
end