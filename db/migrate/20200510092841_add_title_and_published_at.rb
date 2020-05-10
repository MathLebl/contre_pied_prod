class AddTitleAndPublishedAt < ActiveRecord::Migration[6.0]
  def change
    add_column :actus, :title, :string
    add_column :actus, :published_at, :date
  end
end
