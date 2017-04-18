class AddIndexStationToStationsRoute < ActiveRecord::Migration
  def change
    add_column :railway_stations_routes, :station_index, :integer
  end
end
