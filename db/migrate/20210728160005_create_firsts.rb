class CreateFirsts < ActiveRecord::Migration[6.0]
  def change
    create_table :firsts do |t|
      t.integer :third_id

      t.timestamps
    end
  end
end
