class AddPublishedAtToPoducts < ActiveRecord::Migration[6.0]
  def change
    add_column :products, :published_at, :date
  end
end
