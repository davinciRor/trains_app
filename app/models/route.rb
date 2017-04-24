class Route < ActiveRecord::Base
  has_many :trains
  has_many :railway_stations_routes
  has_many :railway_stations, through: :railway_stations_routes, dependent: :destroy

  validates :name, presence: true
  validate :stations_count

  before_validation :set_name

  scope :ordered_railway_stations, -> { joins(:railway_stations_routes).order('railway_stations_routes.station_index') }
  scope :with_station, -> (station) { Route.joins(:railway_stations).where('railway_stations.id = ?', station.id) }

  def first_station
    railway_stations.first
  end

  def last_station
    railway_stations.last
  end

  def arrive_time
    last_station.railway_stations_routes.where(route: self).first.arrive_time
  end

  def outgo_time
    first_station.railway_stations_routes.where(route: self).first.outgo_time
  end

  def self.searched_routes(first_station_id, last_station_id)
    Route.with_station(RailwayStation.find(first_station_id)) &
    Route.with_station(RailwayStation.find(last_station_id))
  end

  private

  def set_name
    self.name = "#{railway_stations.first.title} - #{railway_stations.last.title}"
  end

  def stations_count
    if railway_stations.сount < 2
      errors.add(:base, 'Route must have minimum 2 station')
    end
  end
end
