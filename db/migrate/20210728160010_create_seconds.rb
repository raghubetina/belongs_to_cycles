class CreateSeconds < ActiveRecord::Migration[6.0]
  def change
    create_table :seconds do |t|
      t.integer :first_id

      t.timestamps
    end
  end
end
