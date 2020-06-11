class CreateProducts < ActiveRecord::Migration[6.0]
  def change
    create_table :products do |t|
      t.integer :stock
      t.string :name
      t.references :shop_category, null: false, foreign_key: true
      t.string :photo_url
      t.integer :price

      t.timestamps
    end
  end
end
