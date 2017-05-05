class Ticket < ActiveRecord::Base
  belongs_to :user
  belongs_to :train
  belongs_to :base_station, class_name: 'RailwayStation', foreign_key: :base_station_id
  belongs_to :end_station, class_name: 'RailwayStation', foreign_key: :end_station_id

  after_create :send_notification
  after_destroy :send_delete_notification

  def route_name
    "#{base_station.title} - #{end_station.title}"
  end

  def send_notification
    TicketsMailer.buy_ticket(self.user, self).deliver_now
  end

  def send_delete_notification
    TicketsMailer.delete_ticket(self.user, self).deliver_now
  end
end
