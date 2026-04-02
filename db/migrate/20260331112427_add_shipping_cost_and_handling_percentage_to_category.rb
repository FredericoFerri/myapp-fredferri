class AddShippingCostAndHandlingPercentageToCategory < ActiveRecord::Migration[8.0]
  def change
    add_column :categories, :shipping_cost, :decimal
    add_column :categories, :handling_percentage, :integer
  end
end
