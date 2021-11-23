# == Schema Information
#
# Table name: groups
#
#  id          :bigint           not null, primary key
#  name        :string
#  description :text
#  amount      :decimal(, )
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
class Group < ApplicationRecord
 belongs_to :user
 has_and_belongs_to_many :users
 validates :name, :description, presence: true
 validates_numericality_of :amount
end
