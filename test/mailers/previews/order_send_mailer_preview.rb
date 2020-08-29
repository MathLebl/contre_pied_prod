# Preview all emails at http://localhost:3000/rails/mailers/order_send_mailer
class OrderSendMailerPreview < ActionMailer::Preview
  def order_send
    order = Order.last
    user = order.user
    OrderSendMailer.order_send(order, user)
  end
end
