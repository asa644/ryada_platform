class AddCommentToRates < ActiveRecord::Migration[5.1]
  def change
    add_column :rates, :comment, :text
  end
end
