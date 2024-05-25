class AddCloudinary < ActiveRecord::Migration[7.1]
  def change
    remove_column :instruments, :picture, :string
  end
end
