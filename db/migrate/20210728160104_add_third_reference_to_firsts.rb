class AddThirdReferenceToFirsts < ActiveRecord::Migration[6.0]
  def change
    add_foreign_key :firsts, :thirds
    add_index :firsts, :third_id
    change_column_null :firsts, :third_id, false
  end
end
