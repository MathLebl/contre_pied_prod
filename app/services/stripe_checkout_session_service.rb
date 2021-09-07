class StripeCheckoutSessionService
  def call(event)
    order = Order.find_by(checkout_session_id: event.data.object.id)
    order.update(state: 'paid')
    order.items.each do |item|
      if item.quantity.nil?
        item.product.stock -= 1
      else
        item.product.stock -= item.quantity
      end
    end
  end
end
