class RemoveArtistToActus < ActiveRecord::Migration[6.0]
  def change
    remove_column :actus, :artist_id, :references
  end
end
