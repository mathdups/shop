class ProductsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :update, :edit]
  
  def index
    # @category = Category.find(params[:category_id])
    # @products = @category.products.includes(:variants).order(:title)
    @products = Product.all
  end

  def show 
    @product = Product.find(params[:id])
  end

  def new
    @product = Product.new 
  end

  def edit
    @product = Product.find(params[:id])
  end
  
  def update
    @product = Product.find(params[:id])
      if @product.update_attributes(product_params)
        redirect_to category_product_path(@product, @product.id), notice: "Product updated"
      else
        redirect_to root_path
      end
  end

  def create
    if current_user.admin?
      @product = Product.new(product_params)
      if @product.save
        redirect_to category_product_path(@product, @product.id), notice: 'Le nouveau produit a bien été créé'
      else
        render 'new', notice: "Une erreur s'est produite, votre produit n'a pas été rajouté"
      end
    else redirect_to root_path, notice: "Vous ne pouvez pas rentrer ici car vous n'êtes pas administrateur."
    end
  end

  def destroy
    Product.find(params[:id]).destroy
    flash[:success] = "Product deleted"
    redirect_to root_path
  end


  private

  def product_params
    params.require(:product).permit(:id, :photo, :short_description, :description, :price, :category_id, :title)
  end
end
