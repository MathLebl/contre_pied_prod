class AddWeightToShopCategories < ActiveRecord::Migration[6.0]
  def change
    add_column :shop_categories, :weight, :float
  end
end
