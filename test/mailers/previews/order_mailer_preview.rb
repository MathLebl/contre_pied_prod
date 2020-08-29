# Preview all emails at http://localhost:3000/rails/mailers/order_mailer
class OrderMailerPreview < ActionMailer::Preview
  def order_send
    order = Order.last
    user = order.user
    OrderMailer.order_send(order, user)
  end

  def order_paid
    order = Order.last
    user = order.user
    OrderMailer.order_paid(order, user)
  end
end
