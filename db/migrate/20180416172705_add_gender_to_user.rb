class AddGenderToUser < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :gender, :integer, default: "not specified"
  end
end
