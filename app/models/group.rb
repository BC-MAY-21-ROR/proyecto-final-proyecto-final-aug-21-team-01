class Group < ApplicationRecord
 belongs_to :user
 validates :name, :description, presence: true
 validates_numericality_of :amount
end
