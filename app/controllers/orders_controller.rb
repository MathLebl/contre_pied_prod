class OrdersController < ApplicationController

  def new
    @order = Order.new
    @user = current_user
    if params[:product_id]
      Cart.add_to_cart(session[:cart], params[:product_id])
    end
  end

  def create
    amount = Cart.total_amount(session[:cart])
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
      cancel_url: new_order_payment_url(order),
      customer_email: @current_user.email
    )

    order.update(checkout_session_id: session.id)
    redirect_to new_order_payment_path(order)
  end

  def show
    @order = current_user.orders.find(params[:id])
    Cart.reset_cart(session[:cart])
    @user = current_user
  end

  def update
     @order = Order.find(params[:id])
    @order.update(order_params)
    redirect_to new_order_payment_path(@order)
  end

  private

  # création des entrées dans la table Items
  def create_items_objects(items, order)
    items.each do |element|
      if element.class == Hash
        Item.create!(product_id: element["product_id"], order_id: order.id, quantity: element["quantity"], tsize: element["size"])
      else
        Item.create!(product_id:element, order_id: order.id)
      end
    end
  end

  def set_line_items(items)
    fees = Cart.total_amount(session[:cart])*100
      [{
        name: "Payement de le commande",
        amount: fees.to_i,
        currency: 'eur',
        quantity: 1
      }]
  end

  # def set_line_items(items)
  #   items.map do |item|
  #     {
  #       name: item["name"],
  #       images: [item["photo_url"]],
  #       amount: item["price_cents"],
  #       currency: 'eur',
  #       quantity: 1
  #     }
  #   end
  # end

  def order_params
    params.require(:order).permit(:address, :city, :zip_code, :phone, :comment,
                                  :com, :country)
  end

end
