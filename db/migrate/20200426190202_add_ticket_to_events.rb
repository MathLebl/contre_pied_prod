class AddTicketToEvents < ActiveRecord::Migration[6.0]
  def change
        add_column :events, :ticket, :string

  end
end
