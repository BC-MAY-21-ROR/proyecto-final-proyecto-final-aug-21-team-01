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
require 'rails_helper'

RSpec.describe User, type: :model do
  let(:user) { FactoryBot.create( :user ) }
  describe 'validations' do
    it { should validate_presence_of(:email) }
    it { should validate_presence_of(:password) }
    it { should validate_presence_of(:role) }
    it { should validate_uniqueness_of(:email).ignoring_case_sensitivity }
  end


  describe 'relationship' do
    it { should have_one(:owned_group).class_name('Group') }
  end
  
  describe 'relationship has and belong to many' do
    it { should have_and_belong_to_many(:groups) }
  end

  describe 'user roles enum validation' do
    it do
      should define_enum_for(:role).
      with_values([:free, :premium, :superadmin])
    end
    it 'should create free default free user' do
      should
    end
  end
end
