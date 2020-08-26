ActiveAdmin.register User do
  permit_params :email, :admin, :name, :first_name
  config.filters = false
  menu priority: 5, label: "Administrateurs"

  index do
    column "Nom" do |user|
      link_to user.name, admin_user_path(user)
    end
    column 'Prénom', :first_name
    column  'Admin ?', :admin
    actions
  end
end
