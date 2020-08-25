class RemoveCategoryFromEvents < ActiveRecord::Migration[6.0]
  def change
    remove_column :events, :category, :integer
  end
end
