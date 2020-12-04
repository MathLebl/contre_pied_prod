ActiveAdmin.register User do
  permit_params :email, :name, :first_name, :password, :password_confirmation,
                :address, :city, :zip_code, :phone, :admin
  config.filters = false
  menu priority: 5, label: "Utilisateurs"

  index do
    column 'Nom' do |user|
      link_to user.first_name + " " + user.name, admin_user_path(user)
    end
    column  'Admin ?', :admin
    column 'Confirmé ?' do |user|
      if user.confirmed_at?
        "ok"
      else
        "no"
      end
    end
    column 'Commande ?' do |user|
      user.orders.count
    end
    actions
  end
  show do
    panel "Détails Utilisateur" do
      attributes_table_for user do
        if user.admin == false
        row 'Client' do |user|
          user.first_name + " " + user.name
        end
        row :email
        row :phone
        if !user.orders.empty?
          row "commande" do |user|
            user.orders.each do |order|
              link_to order.id, admin_order_path(order)
            end
          end
          row :address
          row :city
          row :zip_code
        end
      else
        row 'Administrateur' do |user|
          user.first_name + " " + user.name
        end
        row :email
      end
    end
  end
    active_admin_comments
  end

  form do |f|
    f.inputs do
      f.input :name
      f.input :first_name
      f.input :email
      f.input :phone
      f.input :address
      f.input :city
      f.input :zip_code
      f.input :admin
      f.actions
    end
  end
end

