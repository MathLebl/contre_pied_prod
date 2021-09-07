class AddVideoToActus < ActiveRecord::Migration[6.0]
  def change
    add_column :actus, :video, :string
  end
end
