class ProductsController < ApplicationController
  skip_before_action :authenticate_user!

  def index
    if params[:artist] == 'goguettes'
      @products = Product.where(artist_id: 1 ).sort_by { |d| d.ranking }
    elsif params[:artist] == 'valentin'
      @products = Product.where(artist_id: 6 ).sort_by { |d| d.ranking }
    elsif params[:artist] == 'garance'
      @products = Product.where(artist_id: 7 ).sort_by { |d| d.ranking }
    else
      @products = Product.all.sort_by { |d| d.ranking }

    end

    # @products = Product.order(ranking: :asc)
    @index = true
  end

  def show
    @product = Product.find(params[:id])
    @session = session[:cart]
    @index = true
  end
  # Path pour ajout d'un produit dans le panier
  def add_to_cart
    @product = Product.find(params[:id])
    Cart.add_to_cart(session[:cart], params[:id], params[:cart][:quantity], params[:cart][:size], params[:cart][:size2])
    redirect_to product_path(@product)
  end

  # def change_from_cart
  #   @product = Product.find(params[:id])
  #   Cart.change_from_cart(session[:cart], params[:id])
  #   redirect_to product_path(@product)
  # end

  # Path vers la page index panier
  def show_cart
    @cart = session[:cart]
    @products = Product.all
    @amount = Cart.cart_amount(@cart)
    @fees = Cart.cart_fees(@cart)
    @total_weight = Cart.cart_weight(@cart)
    @total_amount = Cart.total_amount(@cart)
    @cart_count = Cart.cart_count(@cart)
    @index = true
  end

  # Path pour suppression d'un produit du panier
  def remove_from_cart
    Cart.remove_from_cart(session[:cart], params[:id])
    redirect_to show_cart_products_path
  end
end
