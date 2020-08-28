class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  before_action :cart
  before_action :configure_permitted_parameters, if: :devise_controller?

  def default_url_options
    { host: ENV["DOMAIN"] || "localhost:3000" || "https://contre-pied-prod-staging.herokuapp.com/" || "https://contre-pied-prod.herokuapp.com/" }
  end
  # Création du panier si celui ci n'existe pas ou est vide
  def cart
    unless session[:cart]
      session[:cart] = []
    end
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:email, :admin, :name, :first_name])
  end
end



