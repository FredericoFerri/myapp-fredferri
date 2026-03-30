# == Schema Information
#
# Table name: categories
#
#  id         :bigint           not null, primary key
#  code       :string
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
FactoryBot.define do
  factory :category do
    name { "MyString" }
    code { "MyString" }
  end
end
