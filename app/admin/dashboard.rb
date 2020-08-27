ActiveAdmin.register_page "Dashboard" do
  menu priority: 1, label: "Tableau de bord"
  content do
    columns do
      column id:'event-board' do
        panel "Prochaines dates" do
          table_for Event.order('date ASC').first(8) do
            column "Dates" do |event|
              link_to event.date, admin_event_path(event)
            end
            column "Artist" do |event|
              link_to event.artist.name, admin_artist_path(event.artist)
            end
            # column "Lieu" do |event|
            #   event.location
            # end
            column "Ville" do |event|
              event.city
            end
          end
          div class:'links'do
            div do |event|
              link_to "Toutes les représentations", admin_events_path
            end
            div do |event|
              link_to "Nouvelle date", new_admin_event_path
            end
          end
        end
      end
      column id:'actu-board' do
        panel "Dernières actus crées" do
          table_for Actu.all do
            column "Titre" do |actu|
              link_to actu.title, admin_actu_path(actu)
            end
            column "Publiée le :" do |actu|
              actu.published_at? ? actu.published_at : "pas encore publiée"
            end
          end
          div class:'links'do
            div do |actu|
              link_to "Toutes les actus", admin_actus_path
            end
            div do |actu|
              link_to "Nouvelle actu", new_admin_actu_path
            end
          end
        end
      end
      column id:'order-board' do
        panel "Commandes" do
          table_for Order.order('created_at ASC').first(8) do
            column "Num" do |order|
              link_to order.id, admin_order_path(order)
            end
            column "État" do |order|
              order.state
            end
            column "Article" do |order|
              order.products.each do |product|
                link_to product.name, admin_product_path(product)
              end
            end
            column "Client" do |order|
              link_to order.user.first_name + " " + order.user.name, admin_user_path(order.user)
            end
            column "adresse" do |order|
              order.address
            end
            column "Total" do |order|
              order.amount
            end
          end
          div class:'links'do
            div do |order|
              link_to "Toutes les commandes", admin_orders_path
            end
          end
        end
      end

    end
  end
end


