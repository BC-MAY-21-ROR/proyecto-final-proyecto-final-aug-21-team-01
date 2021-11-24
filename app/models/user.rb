# == Schema Information
#
# Table name: users
#
#  id                     :bigint           not null, primary key
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  role                   :integer          default("free")
#  reset_password_token   :string
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#
class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :owned_groups, foreign_key: "owner_id", class_name: 'Group'
  has_many :participations, class_name: 'Participant'
  has_many :groups, through: :participations 
  
  validates :email, :password, :role, presence: true
  validates :email, uniqueness: true
  #add enum for role integer field(User Free, User Premium and SuperAdmin User)
  enum role: {free: 0, premium: 1, superadmin: 2}
end
