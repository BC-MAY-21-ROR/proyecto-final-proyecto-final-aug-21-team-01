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
    it { should have_many(:owned_groups).class_name('Group') }
  end
  
  describe 'relationship has and belong to many' do
    it { should have_many(:groups) }
  end

  describe 'user roles enum validation' do
    it do
      should define_enum_for(:role).
      with_values([:free, :premium, :superadmin])
    end
    it 'user have a stripe id nil' do
      user.stripe_id.should be_nil
    end
    it 'should have a stripe id after create stripe id' do
      user.create_stripe_id
      user.stripe_id.should_not be_nil
    end
    it 'should be free' do
      user.role.should eq('free')
    end
    it 'should be premium false' do
      user.premium?.should be_falsey
    end
    it 'should be premium true' do
      user.create_stripe_id
      user.update_attribute(:role, :premium)
      user.premium?.should be_truthy
    end
  end
end
