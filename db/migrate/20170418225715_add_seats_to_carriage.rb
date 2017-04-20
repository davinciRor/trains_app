class AddSeatsToCarriage < ActiveRecord::Migration
  def change
    add_column :carriages, :side_top_seats, :integer
    add_column :carriages, :side_bottom_seats, :integer
    add_column :carriages, :econom_seats, :integer
  end
end
