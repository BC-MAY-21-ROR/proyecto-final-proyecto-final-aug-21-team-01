# == Schema Information
#
# Table name: groups
#
#  id          :bigint           not null, primary key
#  name        :string
#  description :text
#  amount      :decimal(, )
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
require 'rails_helper'

RSpec.describe Group, type: :model do
  let(:group) { FactoryBot.create(:group_with_participants) }
  describe 'validations' do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:description) }
    it { should validate_numericality_of(:amount) }
  end

  describe 'relationship' do
    it { should belong_to(:owner).class_name('User') }
    it { should belong_to(:category) }
  end

  describe 'relationship has and belong to many' do
    it { should have_many(:participants) }
  end

  describe 'contributions calculate' do
    it 'should 6 peoples intrating the group' do
      expect(group.quantity_of_people_in_group).to eq(6)
    end
    it 'should have equitative contributions between participants and the admin of the group' do
      expect(group.individual_contribution.to_f).to eq(group.amount.to_f / group.quantity_of_people_in_group)
    end
  end
end
