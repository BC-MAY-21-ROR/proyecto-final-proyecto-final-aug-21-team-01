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

end
