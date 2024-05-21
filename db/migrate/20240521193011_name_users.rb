class NameUsers < ActiveRecord::Migration[7.1]
  def change
    rename_column :instruments, :user_id, :owner_id
    rename_column :bookings, :user_id, :renter_id
  end
end
