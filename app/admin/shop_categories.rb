ActiveAdmin.register ShopCategory do
  permit_params :name, :weight

  index do
    column "Nom", :name
    column "Poids", :weight
    actions
  end
  show do
    attributes_table do
      row "Nom" do |cat|
        cat.name
      end
      row "Poids" do |cat|
        cat.weight
      end
    end
  end
  form do |f|
    f.inputs do
      f.input :name
      f.input :weight
      f.actions
    end
  end
end
