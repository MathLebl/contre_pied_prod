class OrdersController < ApplicationController
  def new
    @order = Order.new
    add_to_cart
  end

  def create
    amount = cart_amount
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
      cancel_url: order_url(order)
    )

    order.update(checkout_session_id: session.id)
    redirect_to new_order_payment_path(order)
  end

  def show
    @order = current_user.orders.find(params[:id])
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
        images: [item["photo_url"]],
        amount: item["price_cents"],
        currency: 'eur',
        quantity: 1
      }
    end
  end

  def add_to_cart
    @product = Product.find(params[:product_id])
    session[:cart] << @product
  end

  def cart_amount
    amount = 0
    session[:cart].each do |item|
      amount += Product.find(item["id"]).price #methode find pour avoir le money object via .price (car non dispo dans le cookie session[:cart])
    end
    amount
  end

  def order_params
    params.require(:order).permit(:address, :city, :zip_code, :phone)
  end
end
