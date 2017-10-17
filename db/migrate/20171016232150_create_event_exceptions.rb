class CreateEventExceptions < ActiveRecord::Migration[5.1]
  def change
    create_table :event_exceptions do |t|
      t.references :lesson, foreign_key: true
      t.datetime :time

      t.timestamps
    end
  end
end
