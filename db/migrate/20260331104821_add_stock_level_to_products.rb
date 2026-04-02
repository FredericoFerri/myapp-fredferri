class AddStockLevelToProducts < ActiveRecord::Migration[8.0]
  def change
    add_column :products, :stock_level, :integer
  end
end
