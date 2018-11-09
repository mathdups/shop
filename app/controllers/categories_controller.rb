class CategoriesController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]
  
  def index
    @categories = Category.all
  end

  def new
    @category = Category.new
  end



  def create
    @category = Category.new(category_params)
    if @category.save
      redirect_to new_category_product_path(@category, @category.id), notice: 'Le nouveau produit a bien été créé'
    else
        render 'new'
    end
  end

  private

  def category_params
   params.require(:category).permit(:id, :title)
  end
end