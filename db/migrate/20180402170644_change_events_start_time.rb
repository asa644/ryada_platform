class ChangeEventsStartTime < ActiveRecord::Migration[5.1]
  def change
    add_column :events, :start_date, :date
  end
end
