class ProductsController < ApplicationController
  skip_before_action :authenticate_user!

  def index
    @products = Product.all
  end

  def show
    @product = Product.find(params[:id])
    @session = session[:cart]
  end

  # Ajout d'un produit dans le panier
  def add_to_cart
    @product = Product.find(params[:id])
    session[:cart] << @product
    redirect_to products_path
  end
end
