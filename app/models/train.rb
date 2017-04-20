class Train < ActiveRecord::Base
  has_many :tickets
  has_many :carriages, -> (train) { order("number #{train.order_carriage ? 'ASC' : 'DESC'}") }

  belongs_to :route
  belongs_to :current_station, class_name: 'RailwayStation', foreign_key: :current_station_id

  validates :order_carriage, inclusion: { in: [ true, false ] }

  def self.order_carriage
    true
  end
end
