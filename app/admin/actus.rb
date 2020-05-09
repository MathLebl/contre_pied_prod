ActiveAdmin.register Actu do
  sidebar :help do
    "Need help? Email us at help@example.com"
  end
  menu priority: 2
  index do
    column :illustration
    column :video
    column :description
    column "Artist" do |actu|
      link_to actu.artist.name, admin_actu_path(actu)
    end
    actions
  end


end


# permit_params :artist_id
  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters


