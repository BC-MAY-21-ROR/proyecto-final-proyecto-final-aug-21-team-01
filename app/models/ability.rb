# frozen_string_literal: true

# class for users authorization
class Ability
  include CanCan::Ability
  def initialize(user)
    user ||= User.new # guest user (not logged in)
    can :manage, Group, owner_id: user.id
    can :read, Group, participating_users: { user_id: user.id }
  end
end
