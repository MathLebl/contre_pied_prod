ActiveAdmin.register Product do
  menu label: "Articles", priority: 7
#   config.sort_order = 'date_asc'
#   permit_params :category, :description, :date, :time_table, :location, :artist_id, :user_id, :ticket

  action_item :publish, only: :show do
    link_to "retour", admin_products_path
  end

  action_item :publish, only: :index do
    link_to "retour", admin_root_path
  end


#   index do
#     column "Artist" do |event|
#       link_to event.artist.name, admin_artist_path(event.artist)
#     end
#     column :category
#     column "Date" do |event|
#       link_to event.date, admin_event_path(event)
#     end
#     column 'Horaire', :time_table
#     column "Ville", :city
#     column 'Salle', :location
#     column  'Reservable ?' do |event|
#       "Oui" if event.ticket?
#     end
#     actions
#   end

#   filter :artist
#   filter :date
#   filter :city

#   show do
#       attributes_table do
#         row :category
#         row :date
#         row :City
#         row :location
#   end

# end

end
