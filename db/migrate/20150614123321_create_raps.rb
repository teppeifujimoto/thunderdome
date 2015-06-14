class CreateRaps < ActiveRecord::Migration
  def change
    create_table :raps do |t|
      t.integer :beat_id
      t.string :title

      t.timestamps null: false
    end

    add_index :raps, :beat_id
  end
end
