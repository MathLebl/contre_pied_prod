class CreateCredits < ActiveRecord::Migration[6.0]
  def change
    create_table :credits do |t|
      t.string :name
      t.references :artist, null: false, foreign_key: true

      t.timestamps
    end
  end
end