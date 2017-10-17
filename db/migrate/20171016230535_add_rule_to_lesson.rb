class AddRuleToLesson < ActiveRecord::Migration[5.1]
  def change
    add_column :lessons, :rule, :text
  end
end
