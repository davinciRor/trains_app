class CreateCarriages < ActiveRecord::Migration
  def change
    create_table :carriages do |t|
      t.integer :kind
      t.integer :top_seats
      t.integer :bottom_seats
      t.references :train, index: true
      t.timestamps null: false
    end
  end
end
