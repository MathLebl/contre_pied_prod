class RemoveTimeTableToEvents < ActiveRecord::Migration[6.0]
  def change
    remove_column :events, :time_table, :time
  end
end
