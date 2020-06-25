class OrdersController < ApplicationController
  def new
    @order = Order.new
  end

  def create
    # Ligne product.find va bientôt être inutile
    product = Product.find(5) #params[:product_id]
    amount = cart_amount
    order  = Order.new(order_params)
    order.product = product
    order.product_name = product.name
    order.state = 'pending'
    order.user = current_user

    items = session[:cart]

    # Création des modèles Items pour chaque produit dans la commande, et récupération des infos pour la variable line_items
    create_items_objects(items, order)
    line_items = set_line_items(items)

    order.amount = amount
    order.save!

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
    # Si le cart n'est pas vide, on rempli line_items avec ses infos
    unless items.empty?
      items.map do |item|
        {
          name: item["name"],
          images: [item["photo_url"]],
          amount: item["price_cents"],
          currency: 'eur',
          quantity: 1
        }
      end
      # s'il est vide, on rempli line_items avec les infos du produit de la page sur laquelle on a appuyé sur "purchase"
    else
      product = Product.find(5)
      [{
        name: product.name,
        images: [product.photo_url],
        amount: product.price_cents,
        currency: 'eur',
        quantity: 1
      }]
    end
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
