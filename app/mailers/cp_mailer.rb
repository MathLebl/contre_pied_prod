class CpMailer < ApplicationMailer
  def cp_mailer(order)
    @order = order
    @user = @order.user
    mail to: "informations@contrepiedproductions.fr", subject: "Une nouvelle commande numero #{ order.id } à été passée"
  end
end
