class RemoveMounthToEvents < ActiveRecord::Migration[6.0]
  def change
    remove_column :events, :mounth, :string
  end
end
