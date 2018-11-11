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
    @categories = Category.all.map{|c| [ c.title, c.id ] }

  end

  def edit
    @categories = Category.all.map{|c| [ c.title, c.id ] }
    @product = Product.find(params[:id])
  end
  
  def update
    @product.category_id = params[:category_id]
    @product = Product.find(params[:id])
      if @product.update_attributes(product_params)
        @product.save
        redirect_to category_product_path(@product, @product.id), notice: "Product updated"
      else
        @product.save
        redirect_to root_path
      end
  end




  def create 
    @product = Product.new(product_params) 
    @product.category_id = params[:category_id] 
    respond_to do |format| 
    if @product.save 
       format.html { redirect_to category_product_path(@product, @product.id), notice: "Product was successfully created." } 
        format.json { render :show, status: :created, location: @product } 
    else 
        format.html { render :new } 
        format.json { render json: @product.errors, status: :unprocessable_entity } 
    end 
   end 
 end

  
  def destroy
    Product.find(params[:id]).destroy
    flash[:success] = "Product deleted"
    redirect_to root_path
  end


  private
  

  def product_params
    params.require(:product).permit(:id, :photo, :short_description, :description, :price, :title, :category_id, :photo_cache)
  end
end
