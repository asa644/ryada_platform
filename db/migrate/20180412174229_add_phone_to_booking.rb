class AddPhoneToBooking < ActiveRecord::Migration[5.1]
  def change
    add_column :bookings, :phone, :string
  end
end
