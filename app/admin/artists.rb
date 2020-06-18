ActiveAdmin.register Artist do
permit_params :name, :description, :style, :image, :video, :deezer, :spotify, :youtube, :insta, :twitter, :slug, :user_id, :active, :banner, :dice1, :dice2, :dice3, :dice4, :facebook, :soundcloud, :category, :press_file, distribution: [], credits: [], presse: [], partenaires: []
  menu priority: 4
  scope :all
  scope :concert
  scope :spectacle
  scope :jeunePublic


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
    actions do |artist|
    item "Voir sur le site", artist_path(artist)
  end
  end

  filter :name
  filter :category
  filter :style
  filter :active, as: :check_boxes

  form do |f|
    f.inputs do
      f.input :name
      f.input :description, :as => :pagedown_text
      f.input :style
      f.input :image
      f.input :video
      f.input :deezer
      f.input :spotify
      f.input :youtube
      f.input :insta
      f.input :twitter
      f.input :user_id
      f.input :active
      f.input :banner
      f.input :dice1
      f.input :dice2
      f.input :dice3
      f.input :dice4
      f.input :facebook
      f.input :soundcloud
      f.input :distribution
      f.input :credits
      f.input :presse
      f.input :partenaires
      f.input :category
      f.input :press_file
      f.actions
    end
  end
end
