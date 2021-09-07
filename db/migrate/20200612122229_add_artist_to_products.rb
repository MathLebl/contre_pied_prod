class AddArtistToProducts < ActiveRecord::Migration[6.0]
  def change
    add_reference :products, :artist, null: false, foreign_key: true
  end
end
