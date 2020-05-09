ActiveAdmin.register_page "Dashboard" do
  menu priority: 1, label: "Tableau de bord"
  sidebar :help do
    "Need help? Email us at help@example.com"
  end
  content do
    columns do
      column do
        panel "Prochaines dates" do
          table_for Event.all do
            column :date
            column "Artist" do |event|
              link_to event.artist.name, admin_event_path(event)
            end
            column :location
          end
        end
      end
    end
  end
end


