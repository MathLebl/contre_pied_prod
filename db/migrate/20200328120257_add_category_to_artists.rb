class AddCategoryToArtists < ActiveRecord::Migration[6.0]
  def change
    add_column :artists, :category , :string, null: false
  end
end
