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
require 'rails_helper'

RSpec.describe Category, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
