class OrdersController < ApplicationController
  def create
    product = Product.find(params[:product_id])
    order  = Order.create!(product: product, product_name: product.name, amount: product.price, state: 'pending', user: current_user)
    items = session[:cart]
    line_items = items.map do |item|
      {
        name: item["name"],
        images: [item["photo_url"]],
        amount: item["price_cents"],
        currency: 'eur',
        quantity: 1
      }
    end

    session = Stripe::Checkout::Session.create(
      payment_method_types: ['card'],
      line_items: line_items,
      success_url: order_url(order),
      cancel_url: order_url(order)
    )

    order.update(checkout_session_id: session.id)
    redirect_to new_order_payment_path(order)
  end

  def show
    @order = current_user.orders.find(params[:id])
  end

end
