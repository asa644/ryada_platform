class CreateServiceListings < ActiveRecord::Migration[5.1]
  def change
    create_table :service_listings do |t|
      t.references :service, foreign_key: true
      t.references :listing, foreign_key: true

      t.timestamps
    end
  end
end
