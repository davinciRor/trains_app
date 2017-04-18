class Carriage < ActiveRecord::Base
  belongs_to :train

  validates :train, :type, :top_seats, :bottom_seats, presence: true
end
