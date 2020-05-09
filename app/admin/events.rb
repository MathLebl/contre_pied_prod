ActiveAdmin.register Event do
  menu label: "Représentations", priority: 3
  permit_params :category, :description, :date, :time_table, :location, :artist_id, :user_id

  index do
    column :category
    column :date
    column 'Horaire', :time_table
    column 'Salle', :location
    column  'Reservable ?', :ticket
  end


end
