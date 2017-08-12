# This migration comes from kms (originally 20141121112652)
class AddRoleToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :role, :string
  end
end
