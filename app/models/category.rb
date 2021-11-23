# == Schema Information
#
# Table name: categories
#
#  id          :bigint           not null, primary key
#  title       :string
#  description :string
#  group_id    :bigint           not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
class Category < ApplicationRecord
  validates :title, presence: true
  validates_length_of :title, minimum: 4
  belongs_to :group
end
