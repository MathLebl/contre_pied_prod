ActiveAdmin.register Actu do
  permit_params :title, :published_at, :video, :description, :user_id, :featured_image
  menu priority: 2

  scope :all
  scope :publiées
  scope :nonPubliées



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
    column :description
    column "Media" do |actu|
      if actu.video?
        "Vidéo"
      elsif actu.featured_image.attached?
        "Photo"
      end
    end
    column "État" do |actu|
      actu.published_at? ? "Publié le #{ l actu.published_at}" : "Pas encore publiée"
    end
    actions do |actu|
      item "Publier", publish_index_admin_actu_path(actu), method: :put if !actu.published_at?
      item "Dépublier", unpublish_index_admin_actu_path(actu), method: :put if actu.published_at?
    end
  end

  show do
    attributes_table do
      row :title
      row :description
      row "État" do |actu|
        actu.published_at? ? "Publié le #{ l actu.published_at}" : "Pas encore publiée"
      end
      row "Media" do |actu|
        if actu.video?
          link_to actu.video
        elsif actu.featured_image.attached?
          image_tag actu.featured_image, class:'photo-show'
        end
      end
    end
    active_admin_comments
  end

  form do |f|
    f.inputs do
      f.input :user_id, :label => 'User', :as => :select, :collection => User.all.map{|u| ["#{u.first_name}", u.id]}
      f.input :featured_image, as: :file
      f.input :video
      f.input :description, :as => :pagedown_text
      f.input :title
      f.actions
    end
  end
end
