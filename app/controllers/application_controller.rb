class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  before_action :cart
  def cart
    unless session[:cart]
      session[:cart] = []
    end
  end
end
