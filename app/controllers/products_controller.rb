class ProductsController < ApplicationController
  
  def index
    # @category = Category.find(params[:category_id])
    # @products = @category.products.includes(:variants).order(:title)
    @products = Product.all
  end

  def show 
    @product = Product.find(params[:category_id])
  end

  def new
    @product = Product.new 
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      redirect_to category_product_path(@product, @product.id), notice: 'Le nouveau produit a bien été créé'
    else
      render 'new'
    end

  end


  private

  def product_params
    params.require(:product).permit(:id, :short_description, :description, :price, :category_id, :title)
  end
end
