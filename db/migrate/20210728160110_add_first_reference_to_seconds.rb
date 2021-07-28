class AddFirstReferenceToSeconds < ActiveRecord::Migration[6.0]
  def change
    add_foreign_key :seconds, :firsts
    add_index :seconds, :first_id
    change_column_null :seconds, :first_id, false
  end
end
