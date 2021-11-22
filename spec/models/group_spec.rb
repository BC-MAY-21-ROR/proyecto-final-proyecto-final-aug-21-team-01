require 'rails_helper'

RSpec.describe Group, type: :model do
  let(:group) { FactoryBot.create( :group )}

  describe 'validations' do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:description) }
    it { should validate_numericality_of(:amount) }
  end

  describe 'relationship' do
    it { should belong_to(:user) }
  end
end
