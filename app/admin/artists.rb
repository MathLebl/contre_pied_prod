ActiveAdmin.register Artist do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  permit_params :name, :description, :style, :image, :video, :deezer, :spotify, :youtube, :insta, :twitter, :slug, :user_id, :category
  #
  # or
  #
  # permit_params do
  #   permitted = [:name, :description, :style, :image, :video, :deezer, :spotify, :youtube, :insta, :twitter, :slug, :user_id]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end

end
