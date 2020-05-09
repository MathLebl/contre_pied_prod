class CreateActus < ActiveRecord::Migration[6.0]
  def change
    create_table :actus do |t|
      t.text :description
      t.string :illustration
      t.references :artist, foreign_key: true
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
