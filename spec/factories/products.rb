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
FactoryBot.define do
  factory :product do
    name { "MyString" }
    description { "MyText" }
    cost { "9.99" }
  end
end
