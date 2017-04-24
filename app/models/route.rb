class Route < ActiveRecord::Base
  has_many :trains
  has_many :railway_stations_routes
  has_many :railway_stations, through: :railway_stations_routes, dependent: :destroy

  validates :name, presence: true
  validate :stations_count

  before_validation :set_name

  scope :ordered_railway_stations, -> { joins(:railway_stations_routes).order('railway_stations_routes.station_index') }

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
