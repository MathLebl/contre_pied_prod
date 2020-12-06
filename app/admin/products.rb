ActiveAdmin.register Product do
  menu label: "Articles", priority: 7
#   config.sort_order = 'date_asc'
permit_params :stock, :name, :shop_category_id, :price_cents, :artist_id, :ranking,
              :product_image, :description, :product_image2, :product_image3,
              :product_image4, :product_image5, :photo_url



action_item :publish, only: :index do
  link_to "Sur le site", products_path
end

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
  column "Nom" do |product|
    link_to product.name, admin_product_path(product)
  end
  column "Classement", :ranking
  column "Artist" do |product|
    product.artist.name
  end
  column 'Stock', :stock
  column "Prix", :price
  column "Type" do |product|
    product.shop_category.name
  end
  column "Photo" do |product|
    if product.product_image.attached?
      image_tag product.product_image, class:'photo-index'
    elsif product.photo_url
      image_tag product.photo_url, class:'photo-index'
    end
  end
  actions do |product|
    item "Publier", publish_index_admin_product_path(product), style:'margin: 0 7px;', method: :put if !product.published_at?
    item "Dépublier", unpublish_index_admin_product_path(product), style:'margin: 0 7px;', method: :put if product.published_at?
    item "Voir sur le site", product_path(product), style:'margin: 0 7px;'
  end
end

filter :artist
filter :shop_category

show do
  attributes_table do
    row :name
    row :artist
    row "Classement" do |prod|
        prod.ranking
      end
    row :stock
    row :price_cents
    row "Description" if product.description? do |product|
      product.description
    end
    row :shop_category
    row "Photo" do |product|
      if product.product_image.attached?
        image_tag product.product_image, class:'photo-show'
      elsif product.photo_url
        image_tag product.photo_url, class:'photo-show'
      end
    end
      if product.product_image2.attached?
    row "Photo 2" do |product|
        image_tag product.product_image2, class:'photo-show'
    end
      end
      if product.product_image3.attached?
    row "Photo 3" do |product|
        image_tag product.product_image3, class:'photo-show'
      end
    end
      if product.product_image4.attached?
    row "Photo 4" do |product|
        image_tag product.product_image4, class:'photo-show'
      end
    end
      if product.product_image5.attached?
    row "Photo 5" do |product|
        image_tag product.product_image5, class:'photo-show'
      end
    end
  end
  active_admin_comments
end

form do |f|
  f.inputs do
    f.input :name
    f.input :artist_id, :label => 'Artist', :as => :select, :collection => Artist.all.map{|u| ["#{u.name}", u.id]}
    f.input :ranking, label: "Classement", as: :select, collection: (1..Product.count)
    f.input :shop_category_id, :as => :select, :collection => ShopCategory.all.map{|u| ["#{u.name}", u.id]}
    f.input :description
    f.input :price_cents
    f.input :photo_url
    f.input :product_image, as: :file
    f.input :product_image2, as: :file
    f.input :product_image3, as: :file
    f.input :product_image4, as: :file
    f.input :product_image5, as: :file
    f.input :stock
    f.actions
  end
end
end
