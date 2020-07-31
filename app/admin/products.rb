ActiveAdmin.register Product do
  menu label: "Articles", priority: 7
#   config.sort_order = 'date_asc'
permit_params :stock, :name, :shop_category_id, :price_cents, :artist_id, :product_image, :description




action_item :publish, only: :show do
  link_to "retour", admin_products_path
end

action_item :publish, only: :index do
  link_to "retour", admin_root_path
end

action_item :publish, only: :show do
  link_to "Publier", publish_admin_product_path(product), method: :put if !product.published_at?
end

action_item :unpublish, only: :show do
  link_to "Dépublier", unpublish_admin_product_path(product), method: :put if product.published_at?
end

member_action :publish, method: :put do
  product = Product.find(params[:id])
  product.update(published_at: Time.zone.now)
  redirect_to admin_product_path(product)
end

member_action :unpublish, method: :put do
  product = Product.find(params[:id])
  product.update(published_at: nil)
  redirect_to admin_product_path(product)
end

member_action :publish_index, method: :put do
  product = Product.find(params[:id])
  product.update(published_at: Time.zone.now)
  redirect_to admin_products_path
end

member_action :unpublish_index, method: :put do
  product = Product.find(params[:id])
  product.update(published_at: nil)
  redirect_to admin_products_path
end


index do
  column "Artist" do |product|
    link_to product.artist.name, admin_artist_path(product.artist_id)
  end
  column "Prix", :price
  column "Type" do |product|
    link_to product.shop_category.name, admin_product_path(product)
  end
  column 'Stock', :stock
  column "Nom", :name
  actions do |product|
    item "Publier", publish_index_admin_product_path(product), method: :put if !product.published_at?
    item "Dépublier", unpublish_index_admin_product_path(product), method: :put if product.published_at?
    item "Voir sur le site", product_path(product)
  end
end

filter :artist
filter :shop_category

form do |f|
  f.inputs do
    f.input :stock
    f.input :name
    f.input :description
    f.input :shop_category_id, :as => :select, :collection => ShopCategory.all.map{|u| ["#{u.name}", u.id]}
    f.input :price_cents
    f.input :artist_id, :label => 'Artist', :as => :select, :collection => Artist.all.map{|u| ["#{u.name}", u.id]}
    f.input :product_image, as: :file
    f.actions
  end
end
end
