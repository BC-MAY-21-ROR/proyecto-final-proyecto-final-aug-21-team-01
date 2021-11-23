require 'rails_helper'

RSpec.describe Group, type: :model do
  let(:group) { FactoryBot.create( :group )}

  describe 'validations' do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:description) }
    it { should validate_numericality_of(:amount) }
  end

  describe 'relationship has and belong to many' do
    it { should have_and_belong_to_many(:users) }
  end

end
