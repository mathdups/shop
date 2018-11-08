class ProductsController < ApplicationController
  mount_uploader :photo, PhotoUploader
  def index
    @category = Category.find(params[:category_id])
    @products = @category.products.includes(:variants).order(:title)
  end

  def show 
    @product = Product.find(params[:id])
  end

  private


end
