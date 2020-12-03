class OrdersController < ApplicationController

  def new
    @order = Order.new
    @user = current_user
    if params[:product_id]
      Cart.add_to_cart(session[:cart], params[:product_id])
    end
  end

  def create
    amount = Cart.cart_amount(session[:cart])
    order_attributes = {state: 'pending', user: current_user, amount: amount}
    order  = Order.new(order_params)
    order.update(order_attributes)
    order.save!

    items = session[:cart]

    # Création des modèles Items pour chaque produit dans la commande, et récupération des infos pour la variable line_items
    create_items_objects(items, order)
    line_items = set_line_items(items)


    # Lancement de la phase de paiement Stripe
    session = Stripe::Checkout::Session.create(
      payment_method_types: ['card'],
      line_items: line_items,
      success_url: order_url(order),
      cancel_url: new_order_payment_url(order)
    )

    order.update(checkout_session_id: session.id)
    redirect_to new_order_payment_path(order)
  end

  def show
    @order = current_user.orders.find(params[:id])
    Cart.reset_cart(session[:cart])
    @user = current_user
  end



  private

  # création des entrées dans la table Items
  def create_items_objects(items, order)
    items.each do |element|
      Item.create!(product_id: element["id"], order_id: order.id)
    end
  end

  def set_line_items(items)
    items.map do |item|
      {
        name: item["name"],
        images: [item["product_image"]],
        amount: item["price_cents"],
        currency: 'eur',
        quantity: 1
      }
    end
  end

  def order_params
    params.require(:order).permit(:address, :city, :zip_code, :phone)
  end
end
