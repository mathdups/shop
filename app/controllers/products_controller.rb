class ProductsController < ApplicationController
  
  def index
    # @category = Category.find(params[:category_id])
    # @products = @category.products.includes(:variants).order(:title)
    @products = Product.all
  end

  def show 
    @product = Product.find(params[:id])
  end

  def def new
    @product = Product.new
  end
  

  private


end
