class AddLinkToActus < ActiveRecord::Migration[6.0]
  def change
    add_column :actus, :link, :string
  end
end
