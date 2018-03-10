class AddEndTimeToLessons < ActiveRecord::Migration[5.1]
  def change
    add_column :lessons, :end_time, :time
  end
end
