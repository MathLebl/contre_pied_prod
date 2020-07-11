ActiveAdmin.register Artist do
ActiveAdmin.register Presse do
  belongs_to :artist
end
ActiveAdmin.register Credit do
  belongs_to :artist
end
ActiveAdmin.register Partenaire do
  belongs_to :artist
end
ActiveAdmin.register Distribution do
  belongs_to :artist
end
permit_params :name, :description, :style, :image, :video, :spotify,
              :youtube, :insta, :twitter, :slug, :user_id, :active,
              :facebook, :soundcloud, :category,
              :press_file, :banner_image, :show_image1, :show_image2, :show_image3,
              :show_image4, distribution_attributes: [:id, :name, :_destroy],
              credits_attributes: [:id, :name, :_destroy], presse_attributes: [:id, :name, :_destroy],
              partenaires_attributes: [:id, :name, :_destroy]

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

  filter :name, as: :select
  filter :active, as: :check_boxes

  form do |f|
    f.inputs do
      f.input :user_id, :label => 'User', :as => :select, :collection => User.all.map{|u| ["#{u.name}", u.id]}
      f.input :name
      f.input :category
      f.input :description, :as => :pagedown_text
      f.input :style
      f.input :image, as: :file, label: "Vignette"
      f.input :banner_image, as: :file, label: "Bannière"
      f.input :show_image1, as: :file, label: "Image 1"
      f.input :show_image2, as: :file, label: "Image 2"
      f.input :show_image3, as: :file, label: "Image 3"
      f.input :show_image4, as: :file, label: "Image 4"
      f.input :video
      f.input :spotify
      f.input :youtube
      f.input :insta
      f.input :twitter
      f.input :facebook
      f.input :soundcloud
      f.inputs do
      f.has_many :distribution, allow_destroy: true do |t|
        t.input :name
      end
    end
      f.inputs do
      f.has_many :credits, allow_destroy: true do |t|
        t.input :name
      end
    end
    f.inputs do
      f.has_many :presse, allow_destroy: true do |t|
        t.input :name
      end
    end
    f.inputs do
      f.has_many :partenaires, allow_destroy: true do |t|
        t.input :name
      end
    end
      f.input :press_file, as: :file, label: "Dossier de presse", allow_destroy: true
      f.input :active
      f.actions
    end
  end

    show do
    attributes_table do
      row :name
      row :category
      row :description
      row :style
      row "Vignette" do |art|
        "OK" if art.image
      end
      row "Bannière" do |art|
        "OK" if art.banner_image
      end
      row "Image 1" do |art|
        "OK" if art.show_image1
      end
      row "Image 2" do |art|
        "OK" if art.show_image2
      end
      row "Image 3" do |art|
        "OK" if art.show_image3
      end
      row "Image 4" do |art|
        "OK" if art.show_image4
      end
      row :video
      row :spotify
      row :youtube
      row :insta
      row :twitter
      row :facebook
      row :soundcloud
      row :distribution
      row :credits
      row :presse
      row :partenaires
      row "Dossier de Presse" do |art|
        "OK" if art.press_file
      end
      row :active
      end
    end
  end


