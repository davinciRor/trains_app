class RailwayStation < ActiveRecord::Base
  has_many :railway_stations_routes
  has_many :routes, through: :railway_stations_routes, dependent: :destroy
  has_many :trains, inverse_of: :current_station, foreign_key: 'current_station_id'


  validates :title, presence: true

  scope :ordered, -> {
    select('railway_stations.*, railway_stations_routes.station_index').
    joins(:railway_stations_routes).
    order('railway_stations_routes.station_index').uniq
  }

  def update_position(route, index)
    staion_route = station_route(route)
    staion_route.update(station_index: index) if staion_route
  end

  def update_time(route, arrive_time, outgo_time)
    staion_route = station_route(route)
    staion_route.update(arrive_time: arrive_time, outgo_time: outgo_time) if staion_route
  end

  def index(route)
    station_route(route)&.station_index
  end

  def outgo_time(route)
    station_route(route)&.outgo_time
  end

  def arrive_time(route)
    station_route(route)&.arrive_time
  end

  protected

  def station_route(route)
    @station_route ||= railway_stations_routes.where(route: route).first
  end
end
