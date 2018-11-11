class ProductCategoriesController < ApplicationController
  def index 
    @products = Product.all
    @categories = Category.all
  end
  
  def update_categories
    @category = Category.find(params[:id])
    product = @category.products
    @category << product
    @category.save
  end

end
