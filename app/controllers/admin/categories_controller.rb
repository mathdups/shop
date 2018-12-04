class Admin::CategoriesController < ApplicationController
  before_action :authorized?
  def index
    @categories = Category.joins(:products).select('categories.*, count(products.id) as products_count').group('categories.id').order(:title)
    @products = Product.all
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
        redirect_to admin_categories_path, notice: "La catégorie a bien été mise à jour"
      else
        flash[:alert] = "Vous n'êtes pas autorisé à effectuer cette action."
        redirect_to root_path
      end
  end

  def create
    
      @category = Category.new(category_params)
      if @category.save!
        redirect_to admin_categories_path, notice: 'La nouvelle catégorie a bien été créée'
      else
        flash[:alert] = "Vous n'êtes pas autorisé à effectuer cette action."
        redirect_to root_path
      end
  end

  # def destroy
  #   if current_user.admin?
  #     if @category = Category.find(params[:id]).destroy
  #         flash[:notice] = "Catégorie (et tous ses produits) supprimés avec succès"
  #         redirect_to admin_categories_path
  #     else 
  #       flash[:alert] = "Vous n'êtes pas autorisé à effectuer cette action."
  #       redirect_to root_path
  #     end
  #   else redirect_to root_path, alert: "Vous n'êtes pas autorisé à effectuer cette action car vous n'êtes pas administrateur"
  #   end  
  # end

  private
  
  def category_params
    params.require(:category).permit(:title)
  end

  def authorized?
    unless current_user.admin?
      flash[:alert] = "Vous n'êtes pas autorisé à voir cette page."
      redirect_to root_path
    end
  end

end
