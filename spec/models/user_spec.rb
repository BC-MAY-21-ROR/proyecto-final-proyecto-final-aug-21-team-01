require 'rails_helper'

RSpec.describe User, type: :model do
  let(:user) { FactoryBot.create( :user ) }
  describe 'validations' do
    it { should validate_presence_of(:email) }
    it { should validate_presence_of(:password) }
    it { should validate_presence_of(:role) }
    it { should validate_uniqueness_of(:email).ignoring_case_sensitivity }
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
