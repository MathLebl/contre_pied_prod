ActiveAdmin.register Artist do
  menu priority: 4

  index do
    column :name
    column :category
    column :style
    column :active
  end

end

# permit_params :name, :description, :style, :image, :video, :deezer, :spotify, :youtube, :insta, :twitter, :slug, :user_id, :category
