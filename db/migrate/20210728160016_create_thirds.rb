class CreateThirds < ActiveRecord::Migration[6.0]
  def change
    create_table :thirds do |t|
      t.integer :second_id

      t.timestamps
    end
  end
end
