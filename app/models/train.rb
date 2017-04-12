class Train < ActiveRecord::Base
  has_many :tickets
  has_many :carriages

  belongs_to :route
  belongs_to :current_station, class_name: 'RailwayStation', foreign_key: :current_station_id

  def business_carriages
    carriages.business
  end

  def econom_carriages
    carriages.econom
  end

  def business_carriages_count
    business_carriages.count
  end

  def econom_carriages_count
    econom_carriages.count
  end
end
