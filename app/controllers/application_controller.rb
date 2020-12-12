class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  before_action :cart
  before_action :configure_permitted_parameters, if: :devise_controller?

  # def default_url_options
  #   {:host => default_url_host}
  # end

  # Création du panier si celui ci n'existe pas ou est vide
  def cart
    unless session[:cart]
      session[:cart] = []
    end
    @cart = session[:cart]
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:email, :admin, :name, :first_name, :address, :city, :zip_code, :country, :phone])
    devise_parameter_sanitizer.permit(:edit, keys: [:email, :admin, :name, :first_name, :address, :city, :zip_code, :country, :phone, :password, :password_confirmation])
  end

  private

  # def default_url_host
  #   return ENV["DOMAIN"] if ENV["DOMAIN"].present?
  #   return "#{ENV["HEROKU_APP_NAME"]}.herokuapp.com" if ENV["HEROKU_APP_NAME"].present?
  #   "localhost:3000"
  # end
end


