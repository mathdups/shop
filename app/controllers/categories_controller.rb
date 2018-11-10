class CategoriesController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :update, :edit]
  
  def index
    @categories = Category.all
  end

  def new
    @category = Category.new
  end

  def edit 
    @category = Category.find(params[:id])
  end

  def update
    @category = Category.find(params[:id])
    if @category.update_attributes(category_params)
      redirect_to categories_path, notice: "Product updated"
    else
      redirect_to root_path
    end
  end

  def create
    binding.pry
    if current_user.admin?
      @category = Category.new(category_params)
      if @category.save
        redirect_to new_category_product_path(@category), notice: 'La nouvelle catégorie a bien été créée'
      else
          redirect_to root_path, notice: "Une erreur s'est produite, votre catégorie n'a pas été rajouté"
      end
    else redirect_to root_path, notice: "Vous ne pouvez pas rentrer ici car vous n'êtes pas administrateur."
    end
  end

  def destroy
    @category = Category.find(params[:id]).destroy
    flash[:success] = "Category deleted"
    redirect_to categories_path
  end

  private

  def category_params
   params.require(:category).permit(:id, :title, :product_id)
  end
end