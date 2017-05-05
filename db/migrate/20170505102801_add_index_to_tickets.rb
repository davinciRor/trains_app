class AddIndexToTickets < ActiveRecord::Migration
  def change
    add_index :tickets, :base_station_id
    add_index :tickets, :end_station_id
  end
end
