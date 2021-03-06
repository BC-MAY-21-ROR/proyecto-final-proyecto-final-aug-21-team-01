# frozen_string_literal: true

# == Schema Information
#
# Table name: users
#
#  id                     :bigint           not null, primary key
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  remember_created_at    :datetime
#  reset_password_sent_at :datetime
#  reset_password_token   :string
#  role                   :integer          default("free")
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  stripe_id              :string
#
# Indexes
#
#  index_users_on_email                 (email) UNIQUE
#  index_users_on_reset_password_token  (reset_password_token) UNIQUE
#
class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :owned_groups, foreign_key: 'owner_id', class_name: 'Group'
  has_many :participations, class_name: 'Participant'
  has_many :groups, through: :participations

  validates :email, :password, :role, presence: true
  validates :email, uniqueness: true
  # add enum for role integer field(User Free, User Premium and SuperAdmin User)
  enum role: { free: 0, premium: 1, superadmin: 2 }

  def premium?
    role == 'premium'
  end

  def groups_contribution
    groups_owned_amount = owned_groups.map(&:individual_contribution)
    groups_particiations_amount = groups.map(&:individual_contribution)
    groups_owned_amount = groups_owned_amount.size.positive? ? groups_owned_amount.reduce(:+) : 0 
    groups_particiations_amount = groups_particiations_amount.size.positive? ? groups_particiations_amount.reduce(:+) : 0
    (groups_owned_amount + groups_particiations_amount)
  end

  def can_create_groups?
    (role == 'free' && owned_groups.count < 4) || (role == 'premium')
  end

  def create_stripe_id
    customer = Stripe::Customer.create(email: email)
    update_attribute(:stripe_id, customer.id)
  end

  after_create do
    Stripe::Customer.create(email: email)
  end
end
