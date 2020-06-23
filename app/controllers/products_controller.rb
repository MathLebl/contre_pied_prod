class ProductsController < ApplicationController
  skip_before_action :authenticate_user!

  def index
    @products = Product.all
  end

  def show
    @product = Product.find(params[:id])
    @session = session[:cart]
  end

  # Path pour ajout d'un produit dans le panier
  def add_to_cart
    @product = Product.find(params[:id])
    session[:cart] << @product
    redirect_to products_path
  end

  # Path vers la page index panier
  def show_cart
    @cart = session[:cart]
    @products = Product.all
  end

  # Path pour suppression d'un produit du panier
  def remove_from_cart
    @product = Product.find(params[:id])
    session[:cart].reject! do |item|
      item["id"] == @product.id
    end
    redirect_to show_cart_products_path
  end
end
