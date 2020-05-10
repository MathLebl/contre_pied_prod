ActiveAdmin.register Artist do
  menu priority: 4

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
