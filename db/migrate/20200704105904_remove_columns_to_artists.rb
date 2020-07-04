class RemoveColumnsToArtists < ActiveRecord::Migration[6.0]
  def change
    remove_column :artists, :image, :string
    remove_column :artists, :press_file, :string
  end
end
