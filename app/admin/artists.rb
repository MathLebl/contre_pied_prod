ActiveAdmin.register Artist do
  menu priority: 4

  action_item :publish, only: :show do
    link_to "retour", admin_artists_path
  end

  action_item :publish, only: :index do
    link_to "retour", admin_root_path
  end

  index do
    column "Nom" do |artist|
      link_to artist.name, admin_artist_path(artist)
    end
    column :category
    column :style
    column :active
    actions
  end

  filter :name
  filter :category
  filter :style
  filter :active, as: :check_boxes
end

# permit_params :name, :description, :style, :image, :video, :deezer, :spotify, :youtube, :insta, :twitter, :slug, :user_id, :category
