class AddTicketIdToTicketType < ActiveRecord::Migration
  def change
    add_column :ticket_types, :ticket_id, :integer
  end
end
