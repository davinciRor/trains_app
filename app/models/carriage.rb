class Carriage < ActiveRecord::Base
  belongs_to :train

  validates :train, :kind, :top_seats, :bottom_seats, presence: true

  enum kind: [:business, :econom]
end
