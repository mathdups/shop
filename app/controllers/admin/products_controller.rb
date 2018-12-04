class Admin::ProductsController < ApplicationController
  before_action :authorized?
  
  def new 
    @product = Product.new 
  end

  def edit
    @product = Product.find(params[:id])
  end

  def update
    @product = Product.find(params[:id])
      if @product.update_attributes(product_params)
        @product.save
        redirect_to category_product_path(@product), notice: "Le produit a bien été mis à jour"
      else
        flash[:alert] = "Une erreur s'est produite lors de la mise à jour du produit"
        redirect_to root_path
      end
  end

  def create 
    @product = Product.new(product_params) 
    respond_to do |format| 
      if @product.save 
          format.html { redirect_to category_product_path(@product, @product.id), notice: "Le produit a bien été créé" } 
          format.json { render :show, status: :created, location: @product } 
      else 
          format.html { render :new, alert: "Une erreur s'est produite lors de la création du produit" } 
          format.json { render json: @product.errors, status: :unprocessable_entity } 
      end 
    end 
  end

  def destroy
    @product = Product.find(params[:id])
    @product.destroy
    flash[:notice] = "Produit supprimé"
    redirect_to admin_categories_path
  end

  private

  def product_params
    params.require(:product).permit(:id, :photo, :short_description, :description, :price, :title, :category_id, :photo_cache)
  end

  def authorized?
    unless current_user.admin?
      flash[:alert] = "Vous n'êtes pas autorisé à voir cette page."
      redirect_to root_path
    end
  end
end
