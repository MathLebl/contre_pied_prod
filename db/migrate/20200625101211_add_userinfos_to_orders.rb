class AddUserinfosToOrders < ActiveRecord::Migration[6.0]
  def change
    add_column :orders, :address, :string, null: :false
    add_column :orders, :city, :string, null: :false
    add_column :orders, :zip_code, :string, null: :false
    add_column :orders, :phone, :string, null: :false
  end
end
