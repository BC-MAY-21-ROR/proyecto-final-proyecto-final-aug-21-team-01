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
 belongs_to :owner, class_name: 'User'
 has_many :participating_users, class_name: 'Participant'
 has_many :participants, through: :participating_users, source: :user
 belongs_to :category
 validates :participating_users, presence: true 

 validates :name, :description, presence: true
 validates_numericality_of :amount
 accepts_nested_attributes_for :participating_users, allow_destroy: true
end
