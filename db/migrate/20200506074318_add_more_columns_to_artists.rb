class AddMoreColumnsToArtists < ActiveRecord::Migration[6.0]
  def change
    add_column :artists, :banner, :string
    add_column :artists, :dice1, :string
    add_column :artists, :dice2, :string
    add_column :artists, :dice3, :string
    add_column :artists, :dice4, :string

  end
end
