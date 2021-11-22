class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_one :owned_group, foreign_key: "user_id", class_name: "Group"
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates :email, :password, :role, presence: true
  validates :email, uniqueness: true
  #add enum for role integer field(User Free, User Premium and SuperAdmin User)
  enum role: {free: 0, premium: 1, superadmin: 2}
end
