class AddPressFileToArtists < ActiveRecord::Migration[6.0]
  def change
    add_column :artists, :press_file, :string
  end
end
