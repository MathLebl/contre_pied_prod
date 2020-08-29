class OrderMailer < ApplicationMailer

  def order_send(order, user)
    @order = order
    @user = user
    mail to: user.email, subject: "Votre commande numéro #{ order.id } a été envoyée"
  end

  def order_paid(order, user)
    @order = order
    @user = user
    mail to: user.email, subject: "Votre commande numéro #{ order.id } a été prise en compte"
  end
end



