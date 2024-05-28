class AddLongLatToUsers < ActiveRecord::Migration[7.1]
  def change
    add_column :users, :longitude, :float
    add_column :users, :latitude, :float
  end
end
