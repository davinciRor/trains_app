class AddIndexToTrainsForRoutes < ActiveRecord::Migration
  def change
    add_index :trains, :route_id
  end
end
