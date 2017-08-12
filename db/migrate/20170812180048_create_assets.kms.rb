# This migration comes from kms (originally 20141029145253)
class CreateAssets < ActiveRecord::Migration[5.1]
  def change
    create_table :kms_assets do |t|
      t.string :file
      t.string :content_type

      t.timestamps null: false
    end
  end
end
