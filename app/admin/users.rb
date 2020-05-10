ActiveAdmin.register User do
  permit_params :email, :admin, :name
  config.filters = false
  menu priority: 5, label: "Administrateurs"

  index do
    column "Nom" do |user|
      link_to user.name, admin_user_path(user)
    end
    column  'Admin ?', :admin
    actions
  end
end

    # See permitted parameters documentation:
    # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
