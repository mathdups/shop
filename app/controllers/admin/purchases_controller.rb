class Admin::PurchasesController < ApplicationController
  before_action :authorized?

  def index 
    @users = User.all
    @orders = Order.where(status: "open")
    @purchases = Purchase.all 
  end

  def update
    @purchase = purchase.find(params[:id])
    if @purchase.update_attributes(purchase_params)
      @purchase.save
      redirect_to purchases_path, notice: "Status mis à jour"
    else
      redirect_to root_path
    end
  end

  private

  def authorized?
    unless current_user.admin?
      flash[:alert] = "Vous n'êtes pas autorisé à voir cette page."
      redirect_to root_path
    end
  end 

  def purchase_params
    params.require(:purchase).permit(:is_sent)
  end
end