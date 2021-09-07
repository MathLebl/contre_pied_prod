class AddRankingToArtists < ActiveRecord::Migration[6.0]
  def change
    add_column :artists, :ranking, :integer
  end
end
