class RemoveOthersColumnsToArtists < ActiveRecord::Migration[6.0]
  def change
    remove_column :artists, :deezer, :string
    remove_column :artists, :banner, :string
    remove_column :artists, :dice1, :string
    remove_column :artists, :dice2, :string
    remove_column :artists, :dice3, :string
    remove_column :artists, :dice4, :string
    remove_column :artists, :distribution, :string
    remove_column :artists, :credits, :string
    remove_column :artists, :presse, :string
    remove_column :artists, :partenaires, :string
  end
end
