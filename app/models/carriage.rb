class Carriage < ActiveRecord::Base
  belongs_to :train

  validates :train, :type, :number, presence: true
  validates :number, uniqueness: true

  before_validation :add_number

  def add_number
    self.number ||= Carriage.max_number.to_i + 1
  end

  class << self
    def types
      %w(CoupeCarriage CVCarriage EconomCarriage SeatCarriage)
    end

    def max_number
      pluck(:number).max || 0
    end
  end
end
