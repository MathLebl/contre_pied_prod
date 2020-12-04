ActiveAdmin.register Event do
  menu label: "Représentations", priority: 3
  config.sort_order = 'date_asc'
  permit_params :date, :location, :artist_id, :user_id, :ticket,
  :city, :month, :region

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
    column "Date" do |event|
      link_to event.date, admin_event_path(event)
    end
    column "Ville", :city
    column "Région", :region
    column 'Salle', :location
    column "Mois", :month
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
      row :date
      row :city
      row :location
      row "Reservable ?" do |evt|
        "OK" if evt.ticket?
      end
    end
  end
  form do |f|
    f.inputs do
      f.input :user_id, :label => 'User', :as => :select, :collection => User.all.map{|u| ["#{u.first_name}", u.id]}
      f.input :artist_id
      f.input :date
      f.input :location
      f.input :city
      f.input :region
      f.input :ticket
      f.actions
    end
  end
end
