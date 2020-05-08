class AddMoreOthersColumnsToArtists < ActiveRecord::Migration[6.0]
  def change
    add_column :artists, :facebook, :string
    add_column :artists, :soundcloud, :string
    add_column :artists, :distribution, :string, array: true
    add_column :artists, :credits, :string, array: true
    add_column :artists, :presse, :string, array: true
    add_column :artists, :partenaires, :string, array: true
  end
end
