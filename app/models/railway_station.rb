class RailwayStation < ActiveRecord::Base
  has_many :railway_stations_routes
  has_many :routes, through: :railway_stations_routes
  has_many :trains, inverse_of: :current_station, foreign_key: 'current_station_id'
end
