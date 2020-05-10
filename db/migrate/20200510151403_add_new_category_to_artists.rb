class AddNewCategoryToArtists < ActiveRecord::Migration[6.0]
  def change
    add_column :artists, :category, :integer
  end
end
