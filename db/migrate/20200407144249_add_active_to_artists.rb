class AddActiveToArtists < ActiveRecord::Migration[6.0]
  def change
    add_column :artists, :active, :boolean, default: true
  end
end
