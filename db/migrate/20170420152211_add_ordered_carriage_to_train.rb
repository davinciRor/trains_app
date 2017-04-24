class AddOrderedCarriageToTrain < ActiveRecord::Migration
  def change
    add_column :trains, :order_carriage, :boolean, default: false
  end
end
