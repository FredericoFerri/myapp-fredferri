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
class Category < ApplicationRecord
    validates :name, presence: true, uniqueness: true 
    validates :code, presence: true, uniqueness: true 
end
