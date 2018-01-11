class AddPricetoLessons < ActiveRecord::Migration[5.1]
  def change
    add_column :lessons, :price, :float
  end
end
