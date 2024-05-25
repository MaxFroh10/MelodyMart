class AddDefaultValueToBooking < ActiveRecord::Migration[7.1]
  def change
    change_column :bookings, :status, :string, default: "pending"
  end
end
