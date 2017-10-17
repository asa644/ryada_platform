class RenameTable < ActiveRecord::Migration[5.1]
  def change
    rename_table :event_exceptions, :lesson_exceptions
  end
end
