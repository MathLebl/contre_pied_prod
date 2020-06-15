ActiveAdmin.register Actu do
  permit_params :artist_id, :title, :published_at, :illustration, :video, :description, :user_id
  menu priority: 2


  action_item :publish, only: :show do
    link_to "retour", admin_actus_path
  end

  action_item :publish, only: :index do
    link_to "retour", admin_root_path
  end

  action_item :publish, only: :show do
    link_to "Publier", publish_admin_actu_path(actu), method: :put if !actu.published_at?
  end

  action_item :unpublish, only: :show do
    link_to "Dépublier", unpublish_admin_actu_path(actu), method: :put if actu.published_at?
  end

  member_action :publish, method: :put do
    actu = Actu.find(params[:id])
    actu.update(published_at: Time.zone.now)
    redirect_to admin_actu_path(actu)
  end

  member_action :unpublish, method: :put do
    actu = Actu.find(params[:id])
    actu.update(published_at: nil)
    redirect_to admin_actu_path(actu)
  end

  member_action :publish_index, method: :put do
    actu = Actu.find(params[:id])
    actu.update(published_at: Time.zone.now)
    redirect_to admin_actus_path
  end

  member_action :unpublish_index, method: :put do
    actu = Actu.find(params[:id])
    actu.update(published_at: nil)
    redirect_to admin_actus_path
  end


  filter :published_at
  filter :artist



  index do
    column "Titre" do |actu|
      link_to actu.title, admin_actu_path(actu)
    end
    column "Artist" do |actu|
      link_to actu.artist.name, admin_artist_path(actu.artist)
    end
    column :description
    column "Photo" do |actu|
      "Ok" if actu.illustration?
    end
    column "Vidéo" do |actu|
      "Ok" if actu.video?
    end
    column "Publiée le :" do |actu|
      actu.published_at? ? actu.published_at : "pas encore publiée"
    end
    actions do |actu|
    item "Publier", publish_index_admin_actu_path(actu), method: :put if !actu.published_at?
    item "Dépublier", unpublish_index_admin_actu_path(actu), method: :put if actu.published_at?
  end
  end

form do |f|
  f.inputs do
    f.input :description, :as => :pagedown_text
    f.input :artist
    f.input :illustration
    f.input :video
    f.input :title
    f.actions
  end
end
end


# permit_params :artist_id
  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters


