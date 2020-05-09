ActiveAdmin.register Actu do
  menu priority: 2
  index do
    column :illustration
    column :video
    column :description
    column :artist_id
  end


end


# permit_params :artist_id
  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters

