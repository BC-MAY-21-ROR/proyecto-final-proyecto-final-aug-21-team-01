require 'rails_helper'

RSpec.describe Participant, type: :model do
  
  describe 'relationship' do
    it { should belong_to(:user) }
    it { should belong_to(:group) }
  end
end
