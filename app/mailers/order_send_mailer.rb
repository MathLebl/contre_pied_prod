class OrderSendMailer < ApplicationMailer
  def order_send(order)
    @order = order
    @user = @order.user
    mail to: @user.email, subject: "Votre commande numéro #{ order.id } a été envoyée"
  end
end
