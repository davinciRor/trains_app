class Carriage < ActiveRecord::Base
  TYPES = %w(CoupeCarriage CVCarriage EconomCarriage SeatCarriage)

  belongs_to :train

  validates :train, :type, :number, presence: true
  validates :number, uniqueness: { scope: :train_id }

  before_validation :add_number

  def add_number
    self.number ||= self.max_number + 1
  end

  def max_number
    train.carriages.pluck(:number).max || 0
  end
end
