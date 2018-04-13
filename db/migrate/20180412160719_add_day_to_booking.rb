class AddDayToBooking < ActiveRecord::Migration[5.1]
  def change
    add_column :bookings, :day, :date
  end
end
