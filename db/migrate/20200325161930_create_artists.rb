class CreateArtists < ActiveRecord::Migration[6.0]
  def change
    create_table :artists do |t|
      t.string :name
      t.text :description
      t.string :style
      t.string :image
      t.string :video
      t.string :deezer
      t.string :spotify
      t.string :youtube
      t.string :insta
      t.string :twitter
      t.string :slug
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
