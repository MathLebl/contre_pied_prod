class AddCommentToOrders < ActiveRecord::Migration[6.0]
  def change
    add_column :orders, :comment, :string, array: true, default: []
  end
end
