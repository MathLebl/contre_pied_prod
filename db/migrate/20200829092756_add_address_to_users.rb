class AddAddressToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :address, :string, null: :false
    add_column :users, :city, :string, null: :false
    add_column :users, :zip_code, :string, null: :false
    add_column :users, :phone, :string, null: :false
  end
end
