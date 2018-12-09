class Admin::PurchasesController < ApplicationController
  before_action :authorized?

  def index 
    @users = User.all
    @orders = Order.where(status: "open")
    @purchases = Purchase.all 
  end

  def update
    
    @purchase = Purchase.find(params[:id])
    status = !@purchase.is_sent
    @purchase.is_sent = status
    @purchase.save
    redirect_to admin_purchases_path

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