class Ticket < ActiveRecord::Base
  belongs_to :user
  belongs_to :train
  belongs_to :base_station, class_name: 'RailwayStation', foreign_key: :base_station_id
  belongs_to :end_station, class_name: 'RailwayStation', foreign_key: :end_station_id
end
