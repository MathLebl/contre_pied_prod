class OrderMailer < ApplicationMailer
  def order_paid(order)
    @order = order
    @user = @order.user
    mail to: @user.email, subject: "Votre commande numéro #{ order.id } a été prise en compte"
  end
end
