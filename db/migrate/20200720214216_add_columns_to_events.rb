class AddColumnsToEvents < ActiveRecord::Migration[6.0]
  def change
    add_column :events, :region, :string
    add_column :events, :month, :string
  end
end
