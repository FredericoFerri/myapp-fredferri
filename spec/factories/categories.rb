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
FactoryBot.define do
  factory :category do
    name { "MyString" }
    code { "MyString" }
  end
end
