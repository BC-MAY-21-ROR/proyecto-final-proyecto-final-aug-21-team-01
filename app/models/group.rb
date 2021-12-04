# frozen_string_literal: true

# == Schema Information
#
# Table name: groups
#
#  id          :bigint           not null, primary key
#  amount      :decimal(, )
#  description :text
#  name        :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  category_id :bigint           not null
#  owner_id    :bigint           not null
#
# Indexes
#
#  index_groups_on_category_id  (category_id)
#  index_groups_on_owner_id     (owner_id)
#
# Foreign Keys
#
#  fk_rails_...  (category_id => categories.id)
#  fk_rails_...  (owner_id => users.id)
#
class Group < ApplicationRecord
  belongs_to :owner, class_name: 'User'
  has_many :participating_users, class_name: 'Participant'
  has_many :participants, through: :participating_users, source: :user, dependent: :destroy
  belongs_to :category
  validates :participating_users, presence: true
  validates :name, :description, presence: true
  validates_numericality_of :amount
  accepts_nested_attributes_for :participating_users, allow_destroy: true

  def self.owned_and_participating(current_user_id)
    joins(:participants)
      .where(
        [
          'owner_id = :current_user_id OR participants.user_id = :current_user_id',
          { current_user_id: current_user_id }
        ]
      ).group(:id)
  end

  def self.participating(current_user_id)
    joins(:participants)
      .where(
        [
          'participants.user_id = :current_user_id',
          { current_user_id: current_user_id }
        ]
      ).group(:id)
  end

  def self.owned(current_user_id)
    joins(:participants)
      .where(
        [
          'owner_id = :current_user_id',
          { current_user_id: current_user_id }
        ]
      ).group(:id)
  end

  def quantity_of_people_in_group
    participating_users.size + 1
  end

  def individual_contribution
    (amount / quantity_of_people_in_group)
  end
end
