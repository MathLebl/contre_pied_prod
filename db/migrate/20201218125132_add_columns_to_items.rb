class AddColumnsToItems < ActiveRecord::Migration[6.0]
  def change
    add_column :items, :tsize, :string
    add_column :items, :quantity, :integer
  end
end
