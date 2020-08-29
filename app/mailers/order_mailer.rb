class OrderMailer < ApplicationMailer

  def order_send(order)
    @order = order
    @user = user
    mail to: user.email, subject: "Votre commande numéro #{ order.id } a été envoyée"
  end

  def order_paid(order)
    @order = order
    @user = user
    mail to: user.email, subject: "Votre commande numéro #{ order.id } a été prise en compte"
  end
end



