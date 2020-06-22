class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  before_action :cart
  # Création du panier si celui ci n'existe pas ou est vide
  def cart
    unless session[:cart]
      session[:cart] = []
    end
  end
end
