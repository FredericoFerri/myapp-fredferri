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
class Product < ApplicationRecord

    belongs_to :category, optional: true

    def value_of_stock
        return 0 if cost.nil? || stock_level.nil?
        cost*stock_level
    end

    def price_with_vat(date)
        return 0 if cost.nil?
        vat = current_vat_rate(date)
        cost * (1 + vat / 100.0)
    end

    def shipping_and_handling
        return 0 if cost.nil?
        return nil unless category

        shipping = category.shipping_cost || 0
        handling = category.handling_percentage || 0

        return 0 if shipping == 0

        shipping + (cost * handling / 100)
    end

    def value_of_stock_including_vat
        return 0 if cost.nil? || stock_level.nil?

        price_with_vat(Date.today) * stock_level
    end

    def current_vat_rate(date = Date.today)
        return category.vat_rate if category&.vat_rate.present?
        case date
        when Date.new(1991, 3, 19)..Date.new(2008, 11, 30)
            17.5
        when Date.new(2008, 12, 1)..Date.new(2009, 12, 31)
            15
        when Date.new(2010, 1, 1)..Date.new(2011, 1, 3)
            17.5
        else
            20
        end
    end
end
