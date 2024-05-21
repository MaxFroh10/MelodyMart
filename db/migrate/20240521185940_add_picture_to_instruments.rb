class AddPictureToInstruments < ActiveRecord::Migration[7.1]
  def change
    add_column :instruments, :picture, :string
  end
end
