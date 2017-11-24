class AddInfoToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :phone, :string
    add_column :users, :weight, :float
    add_column :users, :height, :float
    add_column :users, :birthdate, :date
  end
end
