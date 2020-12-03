class AddRoleToCredits < ActiveRecord::Migration[6.0]
  def change
    add_column :credits, :role, :string
  end
end
