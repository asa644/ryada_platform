class AddStartTimeToLessons < ActiveRecord::Migration[5.1]
  def change
    add_column :lessons, :start_time, :datetime
    rename_column :lessons, :rule, :recurring
  end
end
