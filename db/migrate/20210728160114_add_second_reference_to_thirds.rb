class AddSecondReferenceToThirds < ActiveRecord::Migration[6.0]
  def change
    add_foreign_key :thirds, :seconds
    add_index :thirds, :second_id
    change_column_null :thirds, :second_id, false
  end
end
