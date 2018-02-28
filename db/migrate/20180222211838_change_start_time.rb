class ChangeStartTime < ActiveRecord::Migration[5.1]
  def change
    change_column :lessons, :start_time, :time
  end
end
