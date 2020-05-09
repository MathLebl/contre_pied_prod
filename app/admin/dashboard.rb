ActiveAdmin.register_page "Dashboard" do
  menu priority: 1, label: "Tableau de bord"
  sidebar :help do
    "Need help? Email us at help@example.com"
  end

  # show do
  #   panel "Prochaines dates" do
  #     table_for order.event do
  #       column "Artist" do |event|
  #         link_to event.artist.name, admin_event_path(event)
  #       end
  #       column :category
  #       column :date
  #       column 'Horaire', :time_table
  #       column 'Salle', :location
  #       column  'Reservable ?', :ticket
  #     end
  #   end
  # end
  table_for event do
    column "Artist" do |event|
      link_to event.artist.name, admin_event_path(event)
    end
    column :category
    column :date
    column 'Horaire', :time_table
    column 'Salle', :location
    column  'Reservable ?', :ticket
  end

end


