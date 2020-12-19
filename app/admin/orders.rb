ActiveAdmin.register Order do
  ActiveAdmin.register Item do
    belongs_to :order
  end
  # includes :item
  menu label: "Commandes", priority: 6
  config.sort_order = 'created_at_asc'
  permit_params :state, :amount_cents, :checkout_session_id, :user_id, :com, :country,
                :created_at, :updated_at, :address, :city, :zip_code, :phone,
                # product_attributes: [:id, :name],
                item_attributes: [:order_id, :product_id, :tsize, :quantity]

  scope :all
  scope :enAttente
  scope :payées
  scope :envoyées
  scope :archivées




  action_item :publish, only: :show do
    link_to "retour", admin_orders_path
  end

  action_item :publish, only: :index do
    link_to "retour", admin_root_path
  end
  action_item :send_order, only: :show do
    link_to "Envoyée", send_order_admin_order_path(order), method: :put if order.state == 'Payé'
  end
  action_item :unsend_order, only: :show do
    link_to "Archivée", unsend_order_admin_order_path(order), method: :put if order.state == 'envoyée'
  end

  member_action :send_order, method: :put do
    order = Order.find(params[:id])
    order.update(state: 'envoyée')
    redirect_to admin_order_path(order)
  end

  member_action :unsend_order, method: :put do
    order = Order.find(params[:id])
    order.update(state: 'Archivée')
    redirect_to admin_order_path(order)
  end

  member_action :send_order_index, method: :put do
    order = Order.find(params[:id])
    order.update(state: 'envoyée')
    redirect_to admin_orders_path
  end

  member_action :unsend_order_index, method: :put do
    order = Order.find(params[:id])
    order.update(state: 'Archivée')
    redirect_to admin_orders_path
  end

  index do
    column "Référence" do |order|
      link_to order.id, admin_order_path(order)
    end
    column "Etat" do |order|
      order.state
    end
    column "Articles" do |order|
      order.items.map do |truc|
        if truc.quantity.nil? && truc.tsize.nil?
          truc.product.name
        else
          if truc.product.shop_category.name == "T-Shirt"
            truc.quantity.to_s + "x " + truc.product.name + " " + "-" + truc.tsize + "-"
          elsif truc.product.shop_category.name == "Pack Goguettes n°2"
            truc.quantity.to_s + "x " + truc.product.name + " " + "-" + truc.tsize + "-"
          elsif truc.product.shop_category.name == "Pack Goguettes n°3"
            truc.quantity.to_s + "x " + truc.product.name + " " + "-" + truc.tsize + "-"
          else
            truc.quantity.to_s + "x " + truc.product.name
          end
      end
    end
  end
    column "Date" do |order|
      order.created_at
    end
    column 'Prix', :amount
    column 'Client' do |order|
      link_to order.user.first_name + " " + order.user.name, admin_user_path(order.user)
    end
    actions do |order|
      item "Envoyée", send_order_index_admin_order_path(order), method: :put if order.state == 'Payé'
      item "Archivée", unsend_order_index_admin_order_path(order), method: :put if order.state == 'envoyée'
    end
  end

  filter :state
  filter :created_at
  filter :amount_cents

  show do
    panel "Détails Commande" do
      attributes_table_for order do
        row 'Client' do |order|
          order.user.first_name + " " + order.user.name
        end
        row :state
        # row "products" do |order|
        #   order.products.each do |product|
        #     product.name
        #   end
        # end
        row 'Articles' do |order|
          order.items.map do |truc|
            if truc.quantity.nil? && truc.tsize.nil?
              truc.product.name
            else
              if truc.product.shop_category.name == "T-Shirt"
                truc.quantity.to_s + "x " + truc.product.name + " " + "-" + truc.tsize + "-"
              elsif truc.product.shop_category.name == "Pack Goguettes n°2"
                truc.quantity.to_s + "x " + truc.product.name + " " + "-" + truc.tsize + "-"
              elsif truc.product.shop_category.name == "Pack Goguettes n°3"
                truc.quantity.to_s + "x " + truc.product.name + " " + "-" + truc.tsize + "-"
              else
                truc.quantity.to_s + "x " + truc.product.name
              end
            end
          end
        end
        row :amount
        row :created_at
        row :address
        row :city
        row :zip_code
        row :country
        row :phone
        row :com
      end
    end
    active_admin_comments
  end
end
