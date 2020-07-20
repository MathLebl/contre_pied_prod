class AddMonthToEvents < ActiveRecord::Migration[6.0]
  def change
    add_column :events, :month, :string
  end
end
