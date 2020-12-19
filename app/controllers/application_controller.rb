class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  before_action :cart
  before_action :configure_permitted_parameters, if: :devise_controller?

  # Création du panier si celui ci n'existe pas ou est vide
  def cart
    unless session[:cart]
      session[:cart] = []
    end
    @cart = session[:cart]
    @cart_count = Cart.cart_count(@cart)
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:email, :admin, :name, :first_name, :address, :city, :zip_code, :country, :phone])
    devise_parameter_sanitizer.permit(:edit, keys: [:email, :admin, :name, :first_name, :address, :city, :zip_code, :country, :phone, :password, :password_confirmation])
  end
end


