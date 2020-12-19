class PaymentsController < ApplicationController
  def new
    @order = current_user.orders.where(state: 'pending').find(params[:order_id])
    @user = current_user
    @cart = session[:cart]
    @fees = Cart.cart_fees(@cart)
  end
end
