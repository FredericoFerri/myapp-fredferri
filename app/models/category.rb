# == Schema Information
#
# Table name: categories
#
#  id                  :bigint           not null, primary key
#  code                :string
#  handling_percentage :integer
#  name                :string
#  shipping_cost       :decimal(, )
#  vat_rate            :decimal(, )
#  created_at          :datetime         not null
#  updated_at          :datetime         not null
#
class Category < ApplicationRecord
    has_many :products
    validates :name, presence: true, uniqueness: true 
    validates :code, presence: true, uniqueness: true 
end
