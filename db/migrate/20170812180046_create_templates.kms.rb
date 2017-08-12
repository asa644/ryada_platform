# This migration comes from kms (originally 20141027083603)
class CreateTemplates < ActiveRecord::Migration[5.1]
  def change
    create_table :kms_templates do |t|
      t.string :name
      t.text :content, default: ""

      t.timestamps null: false
    end
  end
end
