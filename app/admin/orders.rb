ActiveAdmin.register Order do
  menu label: "Commandes", priority: 6
  config.sort_order = 'created_at_asc'
  permit_params :state, :product_name, :amount_cents, :checkout_session_id, :user_id, :product_id, :created_at, :updated_at

  scope :all
  scope :payées
  scope :enAttente



  action_item :publish, only: :show do
    link_to "retour", admin_orders_path
  end

  action_item :publish, only: :index do
    link_to "retour", admin_root_path
  end


  index do
    column "Référence" do |order|
      link_to order.id, admin_order_path(order)
    end
    column "Etat" do |order|
      order.state
    end
    # column "Article" do |order|
    #   link_to order.product_name, admin_product_path(order)
    # end
    column "Date" do |order|
      order.created_at
    end
    column 'Prix', :amount
    column "Client", :user
    actions
  end

  filter :state
  filter :created_at
  filter :amount_cents

  show do
    attributes_table do
      row :state
      row :product_name
      row :created_at
      row :amount
      row :user
    end

  end

end
