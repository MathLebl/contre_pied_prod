class RemoveProductinfosFromOrders < ActiveRecord::Migration[6.0]
  def change

    remove_column :orders, :product_name, :string

    remove_column :orders, :product_id, :bigint
  end
end
