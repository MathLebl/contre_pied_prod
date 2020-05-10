ActiveAdmin.register_page "Dashboard" do
  menu priority: 1, label: "Tableau de bord"
  content do
    columns do
      column do
        panel "Prochaines dates" do
          table_for Event.order('date ASC').first(8) do
            column "Dates" do |event|
              link_to event.date, admin_event_path(event)
            end
            column "Artist" do |event|
              link_to event.artist.name, admin_artist_path(event.artist)
            end
            column :location
            column :city
          end
          div do |event|
            link_to "Toutes les représentations", admin_events_path
          end
        end
      end
      column do
        panel "Dernières actus publiées" do
          table_for Actu.all do
            column "Titre" do |actu|
              link_to actu.title, admin_actu_path(actu)
            end
            column "Publiée le :" do |actu|
              actu.published_at? ? actu.published_at : "pas encore publiée"
            end
            column "Artist" do |actu|
              link_to actu.artist.name, admin_artist_path(actu.artist)
            end
          end
          div do |actu|
            link_to "Toutes les actus", admin_actus_path
          end
        end
      end
    end
  end
end


