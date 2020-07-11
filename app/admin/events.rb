ActiveAdmin.register Event do
  menu label: "Représentations", priority: 3
  config.sort_order = 'date_asc'
  permit_params :category, :date, :time_table, :location, :artist_id, :user_id, :ticket, :city

  action_item :publish, only: :show do
    link_to "retour", admin_events_path
  end

  action_item :publish, only: :index do
    link_to "retour", admin_root_path
  end


  index do
    column "Artist" do |event|
      link_to event.artist.name, admin_artist_path(event.artist)
    end
    column :category
    column "Date" do |event|
      link_to event.date, admin_event_path(event)
    end
    column 'Horaire', :time_table
    column "Ville", :city
    column 'Salle', :location
    column  'Reservable ?' do |event|
      "Oui" if event.ticket?
    end
    actions
  end

  filter :artist
  filter :date
  filter :city

  show do
      attributes_table do
        row :category
        row :date
        row :city
        row :location
        row "Reservable ?" do |evt|
        "OK" if evt.ticket?
      end
  end

end

end
