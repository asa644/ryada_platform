class AddStartTimeToBookings < ActiveRecord::Migration[5.1]
  def change
    add_column :bookings, :start_time, :datetime
  end
end
