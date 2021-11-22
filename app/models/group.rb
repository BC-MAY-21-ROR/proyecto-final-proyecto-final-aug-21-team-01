class Group < ApplicationRecord
 validates :name, :description, presence: true
 validates_numericality_of :amount
end
