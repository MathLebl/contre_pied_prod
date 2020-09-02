ActiveAdmin.register User do
  permit_params :email, :admin, :name, :first_name
  config.filters = false
  menu priority: 5, label: "Utilisateurs"

  index do
    column 'Nom' do |user|
      link_to user.first_name + " " + user.name, admin_user_path(user)
    end
    column  'Admin ?', :admin
    column 'Confirmé ?' do |user|
      "ok" if !user.confirmed_at?
    end
    actions
  end
end
