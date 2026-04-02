# == Schema Information
#
# Table name: products
#
#  id          :bigint           not null, primary key
#  cost        :decimal(, )
#  description :text
#  name        :string
#  stock_level :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  category_id :bigint           not null
#
# Indexes
#
#  index_products_on_category_id  (category_id)
#
# Foreign Keys
#
#  fk_rails_...  (category_id => categories.id)
#
require 'rails_helper'

RSpec.describe Product, type: :model do
  describe '#value_of_stock' do
    it 'calculates the total value of the stock' do
      product = Product.new(cost: 10, stock_level: 300)
      expect(product.value_of_stock).to eq 3000
    end
    it 'should return 0 for value of stock when product cost is 0' do
      product = Product.new(cost: 0, stock_level: 300)
      expect(product.value_of_stock).to eq 0
    end
    it 'should return 0 for value of stock when product cost is nil' do
      product = Product.new(cost: nil, stock_level: 300)
      expect(product.value_of_stock).to eq 0
    end
    it 'should return 0 for value of stock when stock level is 0' do
      product = Product.new(cost: 10, stock_level: 0)
      expect(product.value_of_stock).to eq 0
    end
    it 'should return 0 for value of stock when stock_level is nil' do
      product = Product.new(cost: 10, stock_level: nil)
      expect(product.value_of_stock).to eq 0
    end
  end

  describe '#price_with_vat' do
    it 'should return 120 for product costing 100 and VAT equals to 20%' do
      product = Product.new(cost: 100)
      expect(product.price_with_vat(Date.today)).to eq 120
    end
    it 
  end

  describe '#shipping_and_handling' do
    it 'calculates the shipping cost with the handling percentage' do
      mock_category = double('category', shipping_cost: 10, handling_percentage: 5)
      product = Product.new(cost: 10)
      allow(product).to receive(:category).and_return(mock_category)
      expect(product.shipping_and_handling).to eq 10.5
    end

    it 'calculates 0 shipping cost' do
      mock_category = double('category', shipping_cost: 0, handling_percentage: 5)
      product = Product.new(cost: 10)
      allow(product).to receive(:category).and_return(mock_category)
      expect(product.shipping_and_handling).to eq 0
    end

    it 'calculates 0 handling percentage' do
      mock_category = double('category', shipping_cost: 10, handling_percentage: 0)
      product = Product.new(cost: 10)
      allow(product).to receive(:category).and_return(mock_category)
      expect(product.shipping_and_handling).to eq 10
    end

    it 'returns nil if there is no category' do
      mock_category = nil
      product = Product.new(cost: 10)
      allow(product).to receive(:category).and_return(mock_category)
      expect(product.shipping_and_handling).to eq nil
    end
  end

  describe '#value_of_stock_including_vat' do
    it 'should return value of stock including VAT' do
      product = Product.new(cost: 10, stock_level: 100)
      expect(product.value_of_stock_including_vat).to eq 1200
    end

    it 'should return zero for value of stock including VAT when cost equals zero' do
      product = Product.new(cost: 0, stock_level: 100)
      expect(product.value_of_stock_including_vat).to eq 0
    end
  end

  describe '#current_vat_rate' do
    let(:product) { Product.new }

    it 'returns 17.5% for 1991–2008 period' do
      expect(product.current_vat_rate(Date.new(2000, 1, 1))).to eq 17.5
    end

    it 'returns 15% for 2008–2009 period' do
      expect(product.current_vat_rate(Date.new(2009, 6, 1))).to eq 15
    end

    it 'returns 17.5% for 2010–early 2011 period' do
      expect(product.current_vat_rate(Date.new(2010, 6, 1))).to eq 17.5
    end

    it 'returns 20% after 2011' do
      expect(product.current_vat_rate(Date.new(2020, 1, 1))).to eq 20
    end

    it 'should return 10 of product costing 100 when product belongs to category with vat_rate equals to 10%' do
      mock_category = double('category', vat_rate: 10)
      product = Product.new(cost: 100)
      allow(product).to receive(:category).and_return(mock_category)
      expect(product.current_vat_rate).to eq 10
    end
  end
end
