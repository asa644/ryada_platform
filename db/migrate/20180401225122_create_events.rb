class CreateEvents < ActiveRecord::Migration[5.1]
  def change
    create_table :events do |t|
      t.time :start_time
      t.time :end_time
      t.string :place
      t.string :name
      t.float :price
      t.boolean :happening

      t.timestamps
    end
  end
end
