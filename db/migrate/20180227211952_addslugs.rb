class Addslugs < ActiveRecord::Migration[5.1]
  def change
    add_column :feedbacks, :slug, :string
    add_index :feedbacks, :slug, unique: true
    add_column :subscribers, :slug, :string
    add_index :subscribers, :slug, unique: true
    add_column :listings, :slug, :string
    add_index :listings, :slug, unique: true
    add_column :attendees, :slug, :string
    add_index :attendees, :slug, unique: true

  end
end
