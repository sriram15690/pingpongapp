class CreateBookings < ActiveRecord::Migration
  def change
    create_table :bookings do |t|
      t.datetime :start_time
      t.datetime :end_time
      t.integer :table_id
      t.integer :user_id
      t.timestamps null: false
    end
  end
end
