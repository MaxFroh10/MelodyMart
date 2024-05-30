class UpdateColumnCategoryForInstruments < ActiveRecord::Migration[7.1]
  def change
    remove_column :instruments, :category, :string
    add_reference :instruments, :category, foreign_key: true
    add_reference :instruments, :subcategory, foreign_key: true
  end
end
