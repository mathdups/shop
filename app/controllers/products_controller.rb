class ProductsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :update, :edit]
  


  def show 
    @product = Product.find(params[:id])
  end


end