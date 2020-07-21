class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  before_action :cart

  # def default_url_options
  #   { host: ENV["DOMAIN"] || "localhost:3000" }
  # end
  # Création du panier si celui ci n'existe pas ou est vide
  def cart
    unless session[:cart]
      session[:cart] = []
    end
  end
end
