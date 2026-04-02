class AddVatRateForCategory < ActiveRecord::Migration[8.0]
  def change
    add_column :categories, :vat_rate, :decimal, null: true
  end
end
