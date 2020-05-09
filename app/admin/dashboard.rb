ActiveAdmin.register_page "Dashboard" do
  menu priority: 1, label: "Tableau de bord"


# panel "Prochaines dates" do
#   table_for Event.order("date asc").limit(10) do
#     column 'Artist', :artist_id
#     column :date
#     column 'Salle', :location
#   end
#   strong { link_to admin_artists_path }
# end
    # Here is an example of a simple dashboard with columns and panels.
    #
 #    columns do
 #      column do
 #        panel "Prochaines dates" do
 #          ul do
 #            Event.order("date asc").limit(10).map do |post|
 #              li link_to(event.date, admin_event_path(event))
 #              li link_to(event.location, admin_event_path(event))
 #              li link_to(event.time_table, admin_event_path(event))

 #            end
 #          end
 #        end
 #      end

 #      column do
 #        panel "Info" do
 #          para "Welcome to ActiveAdmin."
 #        end
 #      end
 #    end
 # # content
end
