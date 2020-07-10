class CreateDistributions < ActiveRecord::Migration[6.0]
  def change
    create_table :distributions do |t|
      t.string :name
      t.references :artist, null: false, foreign_key: true

      t.timestamps
    end
  end
end
